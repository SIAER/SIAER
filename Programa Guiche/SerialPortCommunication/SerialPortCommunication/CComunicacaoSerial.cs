using System;
using System.Text;
using System.Drawing;
using System.IO.Ports;
using System.Windows.Forms;
using SIAERClassLibrary;

namespace SIAERComunicacaoSerial
{
    public class CComunicacaoSerial
    {
        #region Enumeradores de Conex�o Serial
        /// <summary>
        /// Enumerador para especificar o tipo de transmiss�o
        /// </summary>
        public enum TransmissionType { Text, Hex }

        /// <summary>
        /// Enumerador para especificar o tipo de mensagem
        /// </summary>
        public enum MessageType { Incoming, Outgoing, Normal, Warning, Error };

        /// <summary>
        /// Enumerador para especificar que dispositivo enviar� na porta serial
        /// </summary>
        public enum QuemEnviara { Onibus, Leitor, Ninguem };
        #endregion

        #region Vari�veis para Conex�o Serial
        //Vari�veis de par�metros
        private string _baudRate = string.Empty;
        private string _parity = string.Empty;
        private string _stopBits = string.Empty;
        private string _dataBits = string.Empty;
        private string _portName = string.Empty;
        private TransmissionType _transType;
        private RichTextBox _displayWindow;
        //Vari�veis globais para auxiliar o Form
        private Color[] CorDaMensagem = { Color.Blue, Color.Green, Color.Black, Color.Orange, Color.Red };
        private SerialPort PortaDeComunicacao = new SerialPort();
        #endregion

        #region M�todos de Leitura e Escrita dos atributos
        
        public string BaudRate
        {
            get { return _baudRate; }
            set { _baudRate = value; }
        }

        public string Parity
        {
            get { return _parity; }
            set { _parity = value; }
        }

        public string StopBits
        {
            get { return _stopBits; }
            set { _stopBits = value; }
        }

         public string DataBits
        {
            get { return _dataBits; }
            set { _dataBits = value; }
        }

         public string PortName
        {
            get { return _portName; }
            set { _portName = value; }
        }

        public TransmissionType CurrentTransmissionType
        {
            get { return _transType; }
            set { _transType = value; }
        }

        public RichTextBox DisplayWindow
        {
            get { return _displayWindow; }
            set { _displayWindow = value; }
        }
        #endregion

        #region Manager Constructors
        /// <summary>
        /// Constructor to set the properties of our Manager Class
        /// </summary>
        /// <param name="baud">Desired BaudRate</param>
        /// <param name="par">Desired Parity</param>
        /// <param name="sBits">Desired StopBits</param>
        /// <param name="dBits">Desired DataBits</param>
        /// <param name="name">Desired PortName</param>
        public CComunicacaoSerial(string baud, string par, string sBits, string dBits, string name, RichTextBox rtb)
        {
            _baudRate = baud;
            _parity = par;
            _stopBits = sBits;
            _dataBits = dBits;
            _portName = name;
            _displayWindow = rtb;
        }

        public CComunicacaoSerial()
        {
            _baudRate = string.Empty;
            _parity = string.Empty;
            _stopBits = string.Empty;
            _dataBits = string.Empty;
            _portName = "COM18";
            _displayWindow = null;
            //Evento criado para reconhecer dados na porta Serial
            PortaDeComunicacao.DataReceived += new SerialDataReceivedEventHandler(DadosRecebidosNaPortaSerial);
        }
        #endregion

        #region WriteData
        public void WriteData(string msg)
        {
            switch (CurrentTransmissionType)
            {
                case TransmissionType.Text:
                    //first make sure the port is open
                    //if its not open then open it
                    if (!(PortaDeComunicacao.IsOpen == true)) PortaDeComunicacao.Open();
                    //send the message to the port
                    PortaDeComunicacao.Write(msg);
                    //display the message
                    DisplayData(MessageType.Outgoing, msg + "\n");
                    break;
                case TransmissionType.Hex:
                    try
                    {
                        //convert the message to byte array
                        byte[] newMsg = HexToByte(msg);
                        //send the message to the port
                        PortaDeComunicacao.Write(newMsg, 0, newMsg.Length);                        
                        //convert back to hex and display
                        DisplayData(MessageType.Outgoing, ByteToHex(newMsg) + "\n");
                    }
                    catch (FormatException ex)
                    {
                        //display error message
                        DisplayData(MessageType.Error, ex.Message);
                    }
                    finally
                    {
                        _displayWindow.SelectAll();
                    }
                    break;
                default:
                    //first make sure the port is open
                    //if its not open then open it
                    if (!(PortaDeComunicacao.IsOpen == true)) PortaDeComunicacao.Open();
                    //send the message to the port
                    PortaDeComunicacao.Write(msg);
                    //display the message
                    DisplayData(MessageType.Outgoing, msg + "\n");
                    break;
            }
        }
        #endregion

        #region HexToByte
        /// <summary>
        /// method to convert hex string into a byte array
        /// </summary>
        /// <param name="msg">string to convert</param>
        /// <returns>a byte array</returns>
        private byte[] HexToByte(string msg)
        {
            //remove any spaces from the string
            msg = msg.Replace(" ", "");
            //create a byte array the length of the
            //divided by 2 (Hex is 2 characters in length)
            byte[] comBuffer = new byte[msg.Length / 2];
            //loop through the length of the provided string
            for (int i = 0; i < msg.Length; i += 2)
                //convert each set of 2 characters to a byte
                //and add to the array
                comBuffer[i / 2] = (byte)Convert.ToByte(msg.Substring(i, 2), 16);
            //return the array
            return comBuffer;
        }
        #endregion

        #region ByteToHex
        /// <summary>
        /// method to convert a byte array into a hex string
        /// </summary>
        /// <param name="comByte">byte array to convert</param>
        /// <returns>a hex string</returns>
        private string ByteToHex(byte[] comByte)
        {
            //create a new StringBuilder object
            StringBuilder builder = new StringBuilder(comByte.Length * 3);
            //loop through each byte in the array
            foreach (byte data in comByte)
                //convert the byte to a string and add to the stringbuilder
                builder.Append(Convert.ToString(data, 16).PadLeft(2, '0').PadRight(3, ' '));
            //return the converted value
            return builder.ToString().ToUpper();
        }
        #endregion

        #region DisplayData
        /// <summary>
        /// method to display the data to & from the port
        /// on the screen
        /// </summary>
        /// <param name="type">MessageType of the message</param>
        /// <param name="msg">Message to display</param>
        [STAThread]
        private void DisplayData(MessageType type, string msg)
        {
            _displayWindow.Invoke(new EventHandler(delegate
        {
            _displayWindow.SelectedText = string.Empty;
            _displayWindow.SelectionFont = new Font(_displayWindow.SelectionFont, FontStyle.Bold);
            _displayWindow.SelectionColor = CorDaMensagem[(int)type];
            _displayWindow.AppendText(msg);
            _displayWindow.ScrollToCaret();
        }));
        }
        #endregion

        #region Iniciar conex�o
        public bool OpenPort()
        {
            try
            {
                //Testando se a porta serial est� livre para comunica��o
                if (PortaDeComunicacao.IsOpen == true) PortaDeComunicacao.Close();

                //Inicializa o Objeto de comunica��o Serial
                PortaDeComunicacao.BaudRate = int.Parse(_baudRate);    //BaudRate
                PortaDeComunicacao.DataBits = int.Parse(_dataBits);    //DataBits
                PortaDeComunicacao.StopBits = (StopBits)Enum.Parse(typeof(StopBits), _stopBits);    //StopBits
                PortaDeComunicacao.Parity = (Parity)Enum.Parse(typeof(Parity), _parity);    //Parity
                PortaDeComunicacao.PortName = _portName;   //PortName
                //now open the port
                PortaDeComunicacao.Open();
                //display message
                //DisplayData(MessageType.Normal, "Port opened at " + DateTime.Now + "\n");
                //return true
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
                return false;
            }
        }
        #endregion

        #region Fechamento de Conex�o
        public bool FecharPortaDeComunicacaoSerial()
        {
        	try
        	{
                PortaDeComunicacao.Close();
        		return true;
        	}
        	catch(Exception ex)
        	{
        		DisplayData(MessageType.Error,ex.Message);
        		return false;
        	}
        	
        }
        #endregion

        #region Carregar ComboBox com os valores padr�es de Paridade
        public void CarregarComboBoxDeParidade(object obj)
        {
            foreach (string str in Enum.GetNames(typeof(Parity)))
            {
                ((ComboBox)obj).Items.Add(str);
            }
        }
        #endregion

        #region Carregar ComboBox com os valores padr�es de Stopbit
        public void CarregarComboBoxDeStopBit(object obj)
        {
            foreach (string str in Enum.GetNames(typeof(StopBits)))
            {
                ((ComboBox)obj).Items.Add(str);
            }
        }
        #endregion

        #region Carregar ComboBox com os valores padr�es de Porta
        public void CarregarComboBoxDePortas(object obj)
        {
            foreach (string str in SerialPort.GetPortNames())
            {
                ((ComboBox)obj).Items.Add(str);
            }
        }
        #endregion

        #region Receber de Dados
        /// <summary>
        /// method that will be called when theres data waiting in the buffer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void DadosRecebidosNaPortaSerial(object sender, SerialDataReceivedEventArgs e)
        {
            String msg = null;
            do
            {
                msg += PortaDeComunicacao.ReadExisting();
            }while(msg[msg.Length-1]!= 10);//10 significa que estamos aguardando um /n, ou seja, uma quebra de linha para parar a verifica��o na porta
            CCodigoDeBarra bars = new CCodigoDeBarra();
            bars.Code = msg;
            if (bars.ValidarCodigoDeBarras() == 0)
            {
                bars.SalvarDadosNoBancoDeDados();
            }
            else 
            { 
                //AVISAR AO USU�RIO QUE A LEITURA FALHOU!!!
            }
        }
        #endregion
    }
}
