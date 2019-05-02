Imports Microsoft.VisualBasic
Imports Telerik.Web.UI
Public Class show_radwindow

#Region "Internal Variables"
    Private m_WhichForm As Integer
    Private m_URL As String
    Private m_OnClose As String
    Private m_Width As Integer
    Private m_Height As Integer
    Private m_Skin As String
    Private m_Title As String
    Private m_Window As RadWindow

#End Region

#Region "Properties"
    Public Property WhichForm() As Integer
        Get
            Return m_WhichForm
        End Get
        Set(ByVal value As Integer)
            m_WhichForm = value
        End Set
    End Property

    Public Property URL() As String
        Get
            Return m_URL
        End Get
        Set(ByVal value As String)
            m_URL = value
        End Set
    End Property

    Public Property Window() As RadWindow
        Get
            Return m_Window
        End Get
        Set(ByVal value As RadWindow)
            m_Window = value
        End Set
    End Property
#End Region

#Region "Constructors"
    Public Sub New()

    End Sub
    Public Sub New(ByVal WhichForm As Integer)
        m_WhichForm = WhichForm
        Setup_Window()

    End Sub
#End Region

#Region "External Methods"
    Public Sub Execute()
        Dim window1 As New RadWindow()
        With window1

            .NavigateUrl = m_URL
            .VisibleOnPageLoad = True
            .Width = m_Width
            .Height = m_Height
            .Behaviors = WindowBehaviors.Close + WindowBehaviors.Move
            .Modal = True
            .CenterIfModal = True
            .Skin = m_Skin
            .KeepInScreenBounds = True
            .VisibleStatusbar = False
            .ShowContentDuringLoad = False
            .OnClientClose = m_OnClose
            .Title = m_Title
            .ID = "RW_1"
        End With
        m_Window = window1
    End Sub
    Public Sub Execute_2()
        Dim window2 As New RadWindow()
        With window2
            .NavigateUrl = m_URL
            .VisibleOnPageLoad = True
            .Width = m_Width
            .Height = m_Height
            .Behaviors = WindowBehaviors.Close + WindowBehaviors.Move
            .Modal = True
            .CenterIfModal = True
            .Skin = m_Skin
            .KeepInScreenBounds = True
            .VisibleStatusbar = False
            .ShowContentDuringLoad = False
            .OnClientClose = m_OnClose
            .Title = m_Title
            .ID = "RW_2"
        End With
        m_Window = window2
    End Sub

#End Region
#Region "Internal Methods"
    Private Sub Setup_Window()

        Select Case m_WhichForm
            Case 1
                m_Width = 810 '530
                m_Height = 440 '500
                m_Skin = "Web20"
                m_Title = "New Waypoint"
                m_OnClose = "fn_close_radwindow"
            Case 2
                m_Width = 400
                m_Height = 150
                m_Skin = "Sunset"
                m_Title = "New Location"
                m_OnClose = "fn_close_radwindow"
            Case 4
                m_Width = 400
                m_Height = 150
                m_Skin = "Sunset"
                m_Title = "Collect"
                m_OnClose = "fn_close_radwindow"
            Case Else
        End Select


    End Sub
#End Region
End Class
