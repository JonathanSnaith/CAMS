Imports Microsoft.VisualBasic
Imports System.Text.RegularExpressions
Imports System.Net.Mail
Imports System.Text
Imports System.Configuration


Public Class Email
#Region "Internal Variables"
    Private m_STMP_Server As String
    Private m_Email_To As String
    Private m_Email_CC As String
    Private m_Email_From As String
    Private m_Email_Subject As String
    Private m_Email_Body As String
#End Region

#Region "Properties"
    Public Property Email_To() As String
        Get
            Return m_Email_To
        End Get
        Set(ByVal value As String)
            m_Email_To = value
        End Set
    End Property

    Public Property Email_CC() As String
        Get
            Return m_Email_CC
        End Get
        Set(ByVal value As String)
            m_Email_CC = value
        End Set
    End Property

    Public Property Email_From() As String
        Get
            Return m_Email_From
        End Get
        Set(ByVal value As String)
            m_Email_From = value
        End Set
    End Property

    Public Property Email_Subject() As String
        Get
            Return m_Email_Subject
        End Get
        Set(ByVal value As String)
            m_Email_Subject = value
        End Set
    End Property

    Public Property Email_Body() As String
        Get
            Return m_Email_Body
        End Get
        Set(ByVal value As String)
            m_Email_Body = value
        End Set
    End Property

    Public Property STMP_Server() As String
        Get
            Return m_STMP_Server
        End Get
        Set(ByVal value As String)
            m_STMP_Server = value
        End Set
    End Property

#End Region

#Region "Instance"
    Public Sub New()

    End Sub


#End Region

#Region "External Method"

    'ByVal Email_To As String, ByVal Email_CC As String, ByVal Email_From As String, ByVal Email_Subject As String, ByVal Email_Body As String
    Public Sub sendEmail()
        Dim mailMessage As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
        mailMessage.IsBodyHtml = True

        Dim to_i As Integer
        Dim to_e As Integer
        Dim mailto As String
        to_e = Len(m_Email_To)
        For to_i = Len(m_Email_To) To 1 Step -1
            If Mid(m_Email_To, to_i, 1) = ";" Then
                mailto = Mid(m_Email_To, to_i + 1, to_e)
                mailMessage.To.Add(New System.Net.Mail.MailAddress(mailto))
                to_e = to_i - 1
            End If
        Next
        mailto = Mid(m_Email_To, 1, to_e)
        mailMessage.To.Add(New System.Net.Mail.MailAddress(mailto))
        '--------------------------------------------------------------
        If Len(m_Email_CC) > 5 Then
            Dim cc_i As Integer
            Dim cc_e As Integer
            Dim mailcc As String
            cc_e = Len(m_Email_CC)
            For cc_i = Len(m_Email_CC) To 1 Step -1
                If Mid(m_Email_CC, cc_i, 1) = ";" Then
                    mailcc = Mid(m_Email_CC, cc_i + 1, cc_e)
                    mailMessage.CC.Add(New System.Net.Mail.MailAddress(mailcc))
                    cc_e = cc_i - 1
                End If
            Next
            mailcc = Mid(m_Email_CC, 1, cc_e)
            mailMessage.CC.Add(New System.Net.Mail.MailAddress(mailcc))
        End If
        '--------------------------------------------------------------
        mailMessage.From = (New System.Net.Mail.MailAddress("plant_management@banksgroup.co.uk", "FLEET"))

        mailMessage.Subject = m_Email_Subject
        mailMessage.Body = m_Email_Body

        Dim smtpClient As System.Net.Mail.SmtpClient = New System.Net.Mail.SmtpClient()
        Try
            'smtpClient.Host = "192.168.48.5"
            smtpClient.Host = m_STMP_Server
            smtpClient.Port = 25

            smtpClient.Send(mailMessage)
        Catch ex As Exception
            Throw New ApplicationException("Data Error", ex)
        End Try
    End Sub
#End Region
End Class
