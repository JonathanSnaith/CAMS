Imports System.Data
Imports Microsoft.VisualBasic
Namespace Setup
    Public Class Combo
        Public Sub New()
        End Sub
        Public Function Populate_AttributeNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal AttributeName As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtAttributeName As DataTable
            dtAttributeName = qry.GetAttributeNames(AttributeName)
            combo.DataSource = dtAttributeName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_AttributeDropdown(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAll As Boolean, ByVal Table As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetAttributeDropdownNames(ShowAll, Table)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_AttributeDropdownfromotherAttribute(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAll As Boolean, ByVal Table As String, LookupID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetAttributeDropdownfromotherAttribute(ShowAll, Table, LookupID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CodeLevelDropdown(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAll As Boolean, ByVal Level As Integer, LevelUpID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetCodeLevelDropdownNames(ShowAll, Level, LevelUpID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CodeLevel3Only(ByRef combo As Telerik.Web.UI.RadComboBox) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetCodeLevel3Only()
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CodeLevel3Only_Parts(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAll As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetCodeLevel3Only_Parts(ShowAll)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Model_Parts(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal Level3 As Integer, ByVal ShowAll As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetModel_Parts(Level3, ShowAll)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Part_Parts(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal Level3 As Integer, ByVal Model As Integer, ByVal ShowAll As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetPart_Parts(Level3, Model, ShowAll)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Location_Parts(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal Location_Type As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetLocation_Parts(Location_Type)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Location_Parts_RW(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal Location_Type As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetLocation_Parts_RW(Location_Type)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CustomerNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAllCustomers As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtCustomerName As DataTable
            dtCustomerName = qry.GetCustomerNames(ShowAllCustomers)
            combo.DataSource = dtCustomerName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CustomerNames_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAllCustomers As Boolean, ByVal Form As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetCustomerNames_EventManagement(ShowAllCustomers, Form)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_SiteNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal SITE_CUS_ID As Integer, ByVal ShowAllSites As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtCustomerName As DataTable
            dtCustomerName = qry.GetSiteNames(SITE_CUS_ID, ShowAllSites)
            combo.DataSource = dtCustomerName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_SiteNames_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal SITE_CUS_ID As Integer, ByVal ShowAllSites As Boolean, ByVal Form As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetSiteNames_EventManagement(SITE_CUS_ID, ShowAllSites, Form)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_ContactNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal CON_CUS_ID As Integer, ByVal SITE_ID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtContactName As DataTable
            dtContactName = qry.GetContactNames(CON_CUS_ID, SITE_ID)
            combo.DataSource = dtContactName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_AssetNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtAssetName As DataTable
            dtAssetName = qry.GetAssetNames(A_CUS_ID, A_SITE_ID)
            combo.DataSource = dtAssetName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_AssetNames_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_CUS_ID As Integer, ByVal E_SITE_ID As Integer, ByVal ShowAllAssets As Boolean, ByVal Form As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetAssetNames_EventManagement(A_CUS_ID, E_SITE_ID, ShowAllAssets, Form)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_CompartmentNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal ShowAll As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtAssetName As DataTable
            dtAssetName = qry.GetCompartmentNames(A_ID, ShowAll)
            combo.DataSource = dtAssetName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_VRNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal CP_ID As Integer, ByVal ShowAll As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtAssetName As DataTable
            dtAssetName = qry.GetVRNames(A_ID, CP_ID, ShowAll)
            combo.DataSource = dtAssetName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_EventTypes(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAllEvents As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEventTypes(ShowAllEvents)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_EventTypes_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllEvents As Boolean, ByVal Form As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEventTypes_EventManagement(A_ID, SITE_ID, ShowAllEvents, Form)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_JobTypes_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllJobs As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetJobTypes_EventManagement(A_ID, SITE_ID, ShowAllJobs)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Codes_Jobs_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ATT_ID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetCodes_Jobs_EventManagement(A_ID, SITE_ID, ATT_ID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Status_Jobs_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetStatus_Jobs_EventManagement()
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Status_FT_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetStatus_FT_EventManagement()
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Events_JobCard(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal Asset As Integer, ByVal LiveOrArchive As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtMain As DataTable
            dtMain = qry.GetEventsforAsset(Asset, LiveOrArchive)
            combo.DataSource = dtMain
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Engineers(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAllEngineers As Boolean, ByVal RecordID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEngineers(ShowAllEngineers, RecordID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Engineers_StringID(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal ShowAllEngineers As Boolean, ByVal RecordID As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEngineers_StringID(ShowAllEngineers, RecordID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Engineers_EventManagement(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllEngineers As Boolean, ByVal Form As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEngineers_EventManagement(A_ID, SITE_ID, ShowAllEngineers, Form)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_AssetsFromActivityStatus(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_CUS_ID As Integer, ByVal Status As String) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetAssetsFromActivityStatus(A_CUS_ID, Status)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_SiteNames_AssetDashJobTab(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal ShowAllSites As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetSiteNames_AssetDashJobTab(A_ID, ShowAllSites)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_JobTypes_AssetDashJobTab(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllJobs As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetJobTypes_AssetDashJobTab(A_ID, SITE_ID, ShowAllJobs)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_JobStatus_AssetDashJobTab(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal JobType As Integer, ByVal ShowAllJobStatus As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetJobStatus_AssetDashJobTab(A_ID, SITE_ID, JobType, ShowAllJobStatus)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_Engineers_AssetDashJobTab(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal JobType As Integer, ByVal Status As String, ByVal ShowAllEngineers As Boolean) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetEngineers_AssetDashJobTab(A_ID, SITE_ID, JobType, Status, ShowAllEngineers)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
        Public Function Populate_ModelAssetListNames(ByRef combo As Telerik.Web.UI.RadComboBox, ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer) As Telerik.Web.UI.RadComboBox
            Dim qry As New Database.Queries
            qry.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CAMSConnectionString").ConnectionString
            Dim dtName As DataTable
            dtName = qry.GetModelAssetListNames(A_CUS_ID, A_SITE_ID)
            combo.DataSource = dtName
            combo.DataBind()
            Return combo
        End Function
    End Class
End Namespace