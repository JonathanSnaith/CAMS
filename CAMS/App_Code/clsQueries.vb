Imports System.Data
Imports Microsoft.VisualBasic

Namespace Database
    Public Class Queries

#Region "Internal Variables"
        Private mConnectionString As String
#End Region

#Region "Properties"
        Public Property ConnectionString() As String
            Get
                Return mConnectionString
            End Get
            Set(ByVal value As String)
                mConnectionString = value
            End Set
        End Property
#End Region

#Region "Contructors"
        Public Sub New()

        End Sub

#End Region

#Region "Exposed Methods"
        Public Function GET_SYS_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GET_SYS_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetModules() As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_MODULES_RG_SELECT_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEmployees() As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EMPLOYEES_LIST_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerDetails(ByVal ENGD_ENG_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ENGINEER_DETAILS_LIST_SP")
                cmd.Parameters("@ENGD_ENG_ID").Value = ENGD_ENG_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeAssetPartsList(ByVal AttributeTable As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_ASSET_RG_ATTRIBUTES_SELECT_SP")
                cmd.Parameters("@ATT_Table").Value = AttributeTable
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeEventsList(ByVal AttributeTable As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_EVENT_RG_ATTRIBUTES_SELECT_SP")
                cmd.Parameters("@ATT_Table").Value = AttributeTable
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeOtherList(ByVal AttributeTable As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_OTHER_RG_ATTRIBUTES_SELECT_SP")
                cmd.Parameters("@ATT_Table").Value = AttributeTable
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeSMUList(ByVal AttributeTable As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_SMU_RG_ATTRIBUTES_SELECT_SP")
                cmd.Parameters("@ATT_Table").Value = AttributeTable
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetDocumentsfromEvent(ByVal E_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetDocumentsfromEvent")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetChart_StatisticsChart(ByVal ChartName As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_STATISTICS_ChartData")
                cmd.Parameters("@ChartName").Value = ChartName
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetChart_AssetDash_EventTypes(ByVal Asset As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CHART_ASSET_DETAILS_EventTypeChartData_Details")
                cmd.Parameters("@Asset").Value = Asset
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetChart_AssetDash_GridEventTypes(ByVal Asset As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CHART_ASSET_DETAILS_EventTypeChartData_Details_Length")
                cmd.Parameters("@Asset").Value = Asset
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetChart_AssetDash_JobTypes(ByVal Asset As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CHART_ASSET_DETAILS_JobTypeChartData_Details")
                cmd.Parameters("@Asset").Value = Asset
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetChart_AssetDash_Servicing(ByVal A_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CHART_ASSET_DETAILS_ServicingChartData_Details")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetDashActiveEvents(ByVal A_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ALL_EVENTS_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetActiveJobs(ByVal E_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ACTIVE_JOBS_RG_SELECT_SP")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetActiveTimesheets(ByVal J_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ACTIVE_FT_RG_SELECT_SP")
                cmd.Parameters("@J_ID").Value = J_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetMagPlugIns_SummaryReport_Asset(ByVal Customer As Integer, ByVal Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime, ByVal Compartment As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetMagPlugIns_SummaryReport_Asset")
                cmd.Parameters("@Customer").Value = Customer
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                cmd.Parameters("@Compartment").Value = Compartment
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetBrakeTestGridEfficiency(ByVal CUS_ID As Integer, ByVal Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetBrakeTestGridEfficiency")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerJobsGridData(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerJobsGridData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerJobsGridDetailData(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerJobsGridDetailData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetBrakeWearGridEfficiencyChartData(ByVal CUS_ID As Integer, ByVal Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetBrakeWearGridEfficiencyChartData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerJobTypeChartData(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerJobTypeChartData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerMachineTypeChartData(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerMachineTypeChartData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerSkillsChartData(ByVal CUS_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerSkillsChartData")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetPartsList(ByVal P_Level_3 As Integer, ByVal P_MOD_ID As Integer, ByVal P_Part_ID As String, ByVal PD_Location_Type As String, ByVal P_Location_ID As Integer, ByVal P_Status As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_SELECT_SP")
                cmd.Parameters("@P_Level_3").Value = P_Level_3
                cmd.Parameters("@P_MOD_ID").Value = P_MOD_ID
                cmd.Parameters("@P_Part_ID").Value = P_Part_ID
                cmd.Parameters("@PD_Location_Type").Value = PD_Location_Type
                cmd.Parameters("@P_Location_ID").Value = P_Location_ID
                cmd.Parameters("@P_Status").Value = P_Status
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetPartsRequestList() As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_REQUEST_SELECT_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEvents(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal E_Description As String, ByVal ActiveOrPlanning As Boolean) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_Description").Value = E_Description
                cmd.Parameters("@ActiveOrPlanning").Value = ActiveOrPlanning
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventsEM(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal E_Description As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_RG_SELECT_EM_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_Description").Value = E_Description
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetJobsEM(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal Level3 As Integer, ByVal J_Status As String, ByVal J_Instruction As String, ByVal E_ID As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ALL_JOBS_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@Level3").Value = Level3
                cmd.Parameters("@J_Status").Value = J_Status
                cmd.Parameters("@J_Instruction").Value = J_Instruction
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetFTEM(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal FT_Status As String, ByVal E_ID As String, ByVal J_ID As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ALL_FT_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@FT_Status").Value = FT_Status
                cmd.Parameters("@E_ID").Value = E_ID
                cmd.Parameters("@J_ID").Value = J_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetFTDAll(ByVal J_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_FTD_RG_SELECT_ALL_RW_SP")
                cmd.Parameters("@J_ID").Value = J_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEIAll(ByVal E_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_ITEMS_RG_SELECT_ALL_RW_SP")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventsArchive(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal E_Description As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ARCHIVE_EVENTS_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_Description").Value = E_Description
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetArchiveJobs(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ATT_ID As Integer, ByVal J_Status As String, ByVal PER_EMP_ID As Integer, ByVal E_ID As String) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ARCHIVE_JOBS_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@J_Status").Value = J_Status
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetDashServicing(ByVal A_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ALL_SER_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetDashServicingArchive(ByVal A_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_SERVICE_ARCHIVE_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetMagPlugList(ByVal CUS_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID_CP As Integer, ByVal ATT_ID_VR As Integer, ByVal PER_EMP_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_MAGNETIC_PLUG_INSPECTIONS_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@ATT_ID_CP").Value = ATT_ID_CP
                cmd.Parameters("@ATT_ID_VR").Value = ATT_ID_VR
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetBrakeTestList(ByVal BRK_CUS_ID As Integer, ByVal BRK_SITE_ID As Integer, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_RG_BRAKETEST_SP")
                cmd.Parameters("@BRK_CUS_ID").Value = BRK_CUS_ID
                cmd.Parameters("@BRK_SITE_ID").Value = BRK_SITE_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetList(ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_ASSET_LIST_RG_SELECT_SP")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@A_SITE_ID").Value = A_SITE_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetContactList(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal CON_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CONTACT_LIST_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@CON_ID").Value = CON_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCustomerList(ByVal CUS_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_LIST_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCustomerSatisfactionList(ByVal CUS_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_SATISFACTION_SURVEY_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCodes_Jobs_EventManagement(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ATT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCodes_Jobs_EventManagement")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetStatus_Jobs_EventManagement() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetStatus_Jobs_EventManagement")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetStatus_FT_EventManagement() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetStatus_FT_EventManagement")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventJobInfoFromJob(ByVal J_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEventJobInfoFromJob")
                cmd.Parameters("@J_ID").Value = J_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventTypes(ByVal ShowAllEvents As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEventTypes")
                cmd.Parameters("@ShowAllEvents").Value = ShowAllEvents
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventTypes_EventManagement(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllEvents As Boolean, Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEventTypes_EventManagement")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ShowAllEvents").Value = ShowAllEvents
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetJobTypes_EventManagement(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllJobs As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetJobTypes_EventManagement")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ShowAllJobs").Value = ShowAllJobs
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventsforAsset(ByVal Asset As Integer, ByVal LiveOrArchive As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEventsforAsset")
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@LiveOrArchive").Value = LiveOrArchive
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineers_StringID(ByVal ShowAllEngineers As Boolean, ByVal RecordID As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineers_StringID")
                cmd.Parameters("@ShowAllEngineers").Value = ShowAllEngineers
                cmd.Parameters("@RecordID").Value = RecordID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineers(ByVal ShowAllEngineers As Boolean, ByVal RecordID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineers")
                cmd.Parameters("@ShowAllEngineers").Value = ShowAllEngineers
                cmd.Parameters("@RecordID").Value = RecordID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineers_EventManagement(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllEngineers As Boolean, Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineers_EventManagement")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ShowAllEngineers").Value = ShowAllEngineers
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetSiteList(ByVal CUS_ID As Integer) As DataSet
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_SITE_LIST_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetSiteNames_AssetDashJobTab(ByVal A_ID As Integer, ByVal ShowAllSites As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetSiteNames_AssetDashJobTab")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@ShowAllSites").Value = ShowAllSites
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetJobTypes_AssetDashJobTab(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ShowAllJobs As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetJobTypes_AssetDashJobTab")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ShowAllJobs").Value = ShowAllJobs
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetJobStatus_AssetDashJobTab(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal JobType As Integer, ByVal ShowAllJobStatus As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetJobStatus_AssetDashJobTab")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@JobType").Value = JobType
                cmd.Parameters("@ShowAllJobStatus").Value = ShowAllJobStatus
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineers_AssetDashJobTab(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal JobType As Integer, ByVal Status As String, ByVal ShowAllEngineers As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineers_AssetDashJobTab")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@JobType").Value = JobType
                cmd.Parameters("@Status").Value = Status
                cmd.Parameters("@ShowAllEngineers").Value = ShowAllEngineers
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeNames(ByVal AttributeName As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAdminAttributes")
                cmd.Parameters("@AttributeName").Value = AttributeName
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeDropdownNames(ByVal ShowAll As Boolean, ByVal Table As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAttributeDropdown")
                cmd.Parameters("@ShowAll").Value = ShowAll
                cmd.Parameters("@Table").Value = Table
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAttributeDropdownfromotherAttribute(ByVal ShowAll As Boolean, ByVal Table As String, ByVal LookupID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAttributeDropdownfromotherAttribute")
                cmd.Parameters("@ShowAll").Value = ShowAll
                cmd.Parameters("@Table").Value = Table
                cmd.Parameters("@LookupID").Value = LookupID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCodeLevelDropdownNames(ByVal ShowAll As Boolean, ByVal Level As Integer, ByVal LevelUpID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCodeLevelDropdown")
                cmd.Parameters("@ShowAll").Value = ShowAll
                cmd.Parameters("@Level").Value = Level
                cmd.Parameters("@LevelUpID").Value = LevelUpID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCodeLevel3Only() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCodeLevel3Only")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCodeLevel3Only_Parts(ByVal ShowAll As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCodeLevel3Only_Parts")
                cmd.Parameters("@ShowAll").Value = ShowAll
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetModel_Parts(ByVal Level3 As Integer, ByVal ShowAll As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetModel_Parts")
                cmd.Parameters("@Level3").Value = Level3
                cmd.Parameters("@ShowAll").Value = ShowAll
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetPart_Parts(ByVal Level3 As Integer, ByVal Model As Integer, ByVal ShowAll As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetPart_Parts")
                cmd.Parameters("@Level3").Value = Level3
                cmd.Parameters("@Model").Value = Model
                cmd.Parameters("@ShowAll").Value = ShowAll
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetLocation_Parts(ByVal Location_Type As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_PART_LOCATION_CB_SP")
                cmd.Parameters("@Location_Type").Value = Location_Type
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetLocation_Parts_RW(ByVal LT As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_PART_LOCATION_CB_RW_SP")
                cmd.Parameters("@LT").Value = LT
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCustomerNames(ByVal ShowAllCustomers As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCustomerNames")
                cmd.Parameters("@ShowAllCustomers").Value = ShowAllCustomers
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCustomerNames_EventManagement(ByVal ShowAllCustomers As Boolean, ByVal Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCustomerNames_EventManagement")
                cmd.Parameters("@ShowAllCustomers").Value = ShowAllCustomers
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetSiteNames(ByVal SITE_CUS_ID As Integer, ByVal ShowAllSites As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetSiteNames")
                cmd.Parameters("@SITE_CUS_ID").Value = SITE_CUS_ID
                cmd.Parameters("@ShowAllSites").Value = ShowAllSites
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetSiteNames_EventManagement(ByVal SITE_CUS_ID As Integer, ByVal ShowAllSites As Boolean, ByVal Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetSiteNames_EventManagement")
                cmd.Parameters("@SITE_CUS_ID").Value = SITE_CUS_ID
                cmd.Parameters("@ShowAllSites").Value = ShowAllSites
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetContactNames(ByVal CON_CUS_ID As Integer, ByVal SITE_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetContactNames")
                cmd.Parameters("@CON_CUS_ID").Value = CON_CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetNames(ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAssetNames")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@A_SITE_ID").Value = A_SITE_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetCompartmentNames(ByVal A_ID As Integer, ByVal ShowAll As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetCompartmentNames")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@ShowAll").Value = ShowAll
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetVRNames(ByVal A_ID As Integer, ByVal CP_ID As Integer, ByVal ShowAll As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetVRNames")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@CP_ID").Value = CP_ID
                cmd.Parameters("@ShowAll").Value = ShowAll
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetNames_EventManagement(ByVal A_CUS_ID As Integer, ByVal E_SITE_ID As Integer, ByVal ShowAllAssets As Boolean, ByVal Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAssetNames_EventManagement")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@E_SITE_ID").Value = E_SITE_ID
                cmd.Parameters("@ShowAllAssets").Value = ShowAllAssets
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetsFromActivityStatus(ByVal A_CUS_ID As Integer, ByVal Status As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAssetsFromActivityStatus")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@Status").Value = Status
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetFromEvent(ByVal E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAssetFromEvent")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetModels(ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer, ByVal ShowAllModels As Boolean, ByVal Form As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetModels")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@A_SITE_ID").Value = A_SITE_ID
                cmd.Parameters("@ShowAllModels").Value = ShowAllModels
                cmd.Parameters("@Form").Value = Form
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetNextEventID() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetNextEventID")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetDefaultDiscount(ByVal CUS_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetDefaultDiscount")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEventItemsTotals(ByVal E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEventItemsTotals")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetAssetNameCheck(ByVal Asset As String, ByVal Customer As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetAssetNameCheck")
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@Customer").Value = Customer
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetModelfromAsset(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetModelfromAsset")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetStufffromAsset(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetStufffromAsset")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetBRKRatioFromDetails(ByVal Cat As Integer, ByVal Model As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetBRKRatioFromDetails")
                cmd.Parameters("@Cat").Value = Cat
                cmd.Parameters("@Model").Value = Model
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetModelAssetListNames(ByVal A_CUS_ID As Integer, ByVal A_SITE_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetModelAssetListNames")
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@A_SITE_ID").Value = A_SITE_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Sub SavePageCount(ByVal PC_Page_Name As String _
                                , ByVal PC_Accessed_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GET_ROW_ID_SP")
                cmd.Parameters("@PC_Page_Name").Value = PC_Page_Name
                cmd.Parameters("@PC_Accessed_By").Value = PC_Accessed_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveAttributesAssetParts(ByVal ATT_ID As Integer _
                                , ByVal ATT_Name As String _
                                , ByVal ATT_Description As String _
                                , ByVal ATT_FLAG As String _
                                , ByVal ATT_Status As String _
                                , ByVal ATT_LOOKUP_ID_Secondary As String _
                                , ByVal ATT_LOOKUP_ID_Model As String _
                                , ByVal ATT_TABLE As String _
                                , ByVal ATT_Created_By As String _
                                , ByVal ATT_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_ASSET_RG_ATTRIBUTES_UPDATE_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@ATT_Name").Value = ATT_Name
                cmd.Parameters("@ATT_Description").Value = ATT_Description
                cmd.Parameters("@ATT_FLAG").Value = ATT_FLAG
                cmd.Parameters("@ATT_Status").Value = ATT_Status
                cmd.Parameters("@ATT_LOOKUP_ID_Secondary").Value = ATT_LOOKUP_ID_Secondary
                cmd.Parameters("@ATT_LOOKUP_ID_Model").Value = ATT_LOOKUP_ID_Model
                cmd.Parameters("@ATT_TABLE").Value = ATT_TABLE
                cmd.Parameters("@ATT_Created_By").Value = ATT_Created_By
                cmd.Parameters("@ATT_Modified_By").Value = ATT_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveAttributesEvents(ByVal ATT_ID As Integer _
                                , ByVal ATT_Name As String _
                                , ByVal ATT_Description As String _
                                , ByVal ATT_FLAG As String _
                                , ByVal ATT_Status As String _
                                , ByVal ATT_LOOKUP_ID_JT As String _
                                , ByVal ATT_LOOKUP_ID_DT As String _
                                , ByVal ATT_TABLE As String _
                                , ByVal ATT_Created_By As String _
                                , ByVal ATT_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_EVENT_RG_ATTRIBUTES_UPDATE_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@ATT_Name").Value = ATT_Name
                cmd.Parameters("@ATT_Description").Value = ATT_Description
                cmd.Parameters("@ATT_FLAG").Value = ATT_FLAG
                cmd.Parameters("@ATT_Status").Value = ATT_Status
                cmd.Parameters("@ATT_LOOKUP_ID_JT").Value = ATT_LOOKUP_ID_JT
                cmd.Parameters("@ATT_LOOKUP_ID_DT").Value = ATT_LOOKUP_ID_DT
                cmd.Parameters("@ATT_TABLE").Value = ATT_TABLE
                cmd.Parameters("@ATT_Created_By").Value = ATT_Created_By
                cmd.Parameters("@ATT_Modified_By").Value = ATT_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub

        Public Sub SaveAttributesOther(ByVal ATT_ID As Integer _
                                , ByVal ATT_Name As String _
                                , ByVal ATT_Description As String _
                                , ByVal ATT_Status As String _
                                , ByVal ATT_TABLE As String _
                                , ByVal ATT_Created_By As String _
                                , ByVal ATT_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_OTHER_RG_ATTRIBUTES_UPDATE_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@ATT_Name").Value = ATT_Name
                cmd.Parameters("@ATT_Description").Value = ATT_Description
                cmd.Parameters("@ATT_Status").Value = ATT_Status
                cmd.Parameters("@ATT_TABLE").Value = ATT_TABLE
                cmd.Parameters("@ATT_Created_By").Value = ATT_Created_By
                cmd.Parameters("@ATT_Modified_By").Value = ATT_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveAttributesSMU(ByVal ATT_ID As Integer _
                                , ByVal ATT_Name As String _
                                , ByVal ATT_Description As String _
                                , ByVal ATT_FLAG As String _
                                , ByVal ATT_Status As String _
                                , ByVal ATT_LOOKUP_ID As String _
                                , ByVal ATT_LOOKUP_ID_Trigger_Code As String _
                                , ByVal ATT_TABLE As String _
                                , ByVal ATT_Created_By As String _
                                , ByVal ATT_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_SMU_RG_ATTRIBUTES_UPDATE_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@ATT_Name").Value = ATT_Name
                cmd.Parameters("@ATT_Description").Value = ATT_Description
                cmd.Parameters("@ATT_FLAG").Value = ATT_FLAG
                cmd.Parameters("@ATT_Status").Value = ATT_Status
                cmd.Parameters("@ATT_LOOKUP_ID").Value = ATT_LOOKUP_ID
                cmd.Parameters("@ATT_LOOKUP_ID_Trigger_Code").Value = ATT_LOOKUP_ID_Trigger_Code
                cmd.Parameters("@ATT_TABLE").Value = ATT_TABLE
                cmd.Parameters("@ATT_Created_By").Value = ATT_Created_By
                cmd.Parameters("@ATT_Modified_By").Value = ATT_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveEngineerDetail(ByVal ENGD_ID As Integer _
                                , ByVal ENGD_ENG_ID As Integer _
                                , ByVal ENGD_Rate As String _
                                , ByVal ENGD_Off_Peak_Rate As String _
                                , ByVal ENGD_Mileage_Rate As String _
                                , ByVal ENGD_Date_From As DateTime _
                                , ByVal ENGD_Date_To As DateTime _
                                , ByVal ENGD_Current As Integer _
                                , ByVal ENGD_Status As String _
                                , ByVal ENGD_Created_By As String _
                                , ByVal ENGD_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ENGINEER_DETAILS_UPDATE_SP")
                cmd.Parameters("@ENGD_ID").Value = ENGD_ID
                cmd.Parameters("@ENGD_ENG_ID").Value = ENGD_ENG_ID
                cmd.Parameters("@ENGD_Rate").Value = ENGD_Rate
                cmd.Parameters("@ENGD_Off_Peak_Rate").Value = ENGD_Off_Peak_Rate
                cmd.Parameters("@ENGD_Mileage_Rate").Value = ENGD_Mileage_Rate
                cmd.Parameters("@ENGD_Date_From").Value = ENGD_Date_From
                cmd.Parameters("@ENGD_Date_To").Value = ENGD_Date_To
                cmd.Parameters("@ENGD_Current").Value = ENGD_Current
                cmd.Parameters("@ENGD_Status").Value = ENGD_Status
                cmd.Parameters("@ENGD_Created_By").Value = ENGD_Created_By
                cmd.Parameters("@ENGD_Modified_By").Value = ENGD_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveAsset(ByVal A_ID As Integer _
                                , Optional ByVal A_CUS_ID As Integer = 1 _
                                , Optional ByVal A_Asset_ID As String = "*Unknown" _
                                , Optional ByVal A_MOD_ID As Integer = 256 _
                                , Optional ByVal A_AP_ID As Integer = 1 _
                                , Optional ByVal A_AS_ID As Integer = 17 _
                                , Optional ByVal A_COM_ID As Integer = 112 _
                                , Optional ByVal A_CAT_ID As Integer = 991 _
                                , Optional ByVal A_TYPE_ID As Integer = 2713 _
                                , Optional ByVal A_SITE_ID As Integer = 0 _
                                , Optional ByVal A_Plant_Rate_Insitu As String = "0" _
                                , Optional ByVal A_Plant_Rate_Soils As String = "0" _
                                , Optional ByVal A_Production_Rate As String = "0" _
                                , Optional ByVal A_Activity_Status As String = "Active" _
                                , Optional ByVal A_Serial_No As String = "" _
                                , Optional ByVal A_Year As Integer = 0 _
                                , Optional ByVal A_Date_Purchase As DateTime = Nothing _
                                , Optional ByVal A_Engine As Integer = 0 _
                                , Optional ByVal A_Eng_SMU_1 As String = "" _
                                , Optional ByVal A_Eng_SMU_2 As String = "" _
                                , Optional ByVal A_Eng_Serial_1 As String = "" _
                                , Optional ByVal A_Eng_Serial_2 As String = "" _
                                , Optional ByVal A_Order_Number As String = "" _
                                , Optional ByVal A_Off_Hire_Number As String = "" _
                                , Optional ByVal A_Hire_ID As String = "" _
                                , Optional ByVal A_HC_ID As String = "2933" _
                                , Optional ByVal A_Hire_Rate As String = "0" _
                                , Optional ByVal A_Hire_Rate_External As String = "0" _
                                , Optional ByVal A_Hire_Rate_Unit As String = "" _
                                , Optional ByVal A_Hire_Rate_Unit_External As String = "" _
                                , Optional ByVal A_Hours_Hire As String = "0" _
                                , Optional ByVal A_Excess_Hour_Rate As String = "0" _
                                , Optional ByVal A_Transport_Rate_On As String = "0" _
                                , Optional ByVal A_Transport_Rate_Off As String = "0" _
                                , Optional ByVal A_Insurance_Value As String = "0" _
                                , Optional ByVal A_Insurance_New_For_Old_Value As String = "0" _
                                , Optional ByVal A_Insurance_Status As String = "" _
                                , Optional ByVal A_Telemetry As Integer = -1 _
                                , Optional ByVal A_Prime_Mover_Report As Integer = -1 _
                                , Optional ByVal A_Brake_Test As Integer = -1 _
                                , Optional ByVal A_Timesheet As Integer = -1 _
                                , Optional ByVal A_SMU As Integer = -1 _
                                , Optional ByVal A_Fuel As Integer = -1 _
                                , Optional ByVal A_Fuel_Type As String = "" _
                                , Optional ByVal A_Service As Integer = -1 _
                                , Optional ByVal A_Service_Status As String = "" _
                                , Optional ByVal A_Planning_Status As String = "" _
                                , Optional ByVal A_Hire As Integer = 0 _
                                , Optional ByVal A_Inspection As Integer = 0 _
                                , Optional ByVal A_Spec_Type As String = "" _
                                , Optional ByVal A_Blade_Bucket_Size As String = "" _
                                , Optional ByVal A_Track_Tyre_Size As String = "" _
                                , Optional ByVal A_Body_Type As String = "" _
                                , Optional ByVal A_Body_Capacity As String = "" _
                                , Optional ByVal A_Operating_Weight As String = "" _
                                , Optional ByVal A_Purchase_SMU As String = "0" _
                                , Optional ByVal A_Warranty_Expiry_Date As DateTime = Nothing _
                                , Optional ByVal A_Estimated_Disposal_Hours As String = "0" _
                                , Optional ByVal A_Date_Sold As Date = Nothing _
                                , Optional ByVal A_Sold_SMU As String = "0" _
                                , Optional ByVal A_CO_Emissions As String = "" _
                                , Optional ByVal A_Nox_Emissions As String = "" _
                                , Optional ByVal A_HC_Emissions As String = "" _
                                , Optional ByVal A_Particulates As String = "" _
                                , Optional ByVal A_External_Noise_dB As String = "" _
                                , Optional ByVal A_External_Noise_Power As String = "" _
                                , Optional ByVal A_Operator_Ear_dB As String = "" _
                                , Optional ByVal A_Operator_Ear_Power As String = "" _
                                , Optional ByVal A_Status As String = "Open" _
                                , Optional ByVal A_Photo_Link As String = "" _
                                , Optional ByVal A_QR_Link As String = "" _
                                , Optional ByVal A_Notes As String = "" _
                                , Optional ByVal A_Created_By As String = "CAMS" _
                                , Optional ByVal A_Modified_By As String = "CAMS")
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_ASSET_LIST_RG_UPDATE_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@A_CUS_ID").Value = A_CUS_ID
                cmd.Parameters("@A_Asset_ID").Value = A_Asset_ID
                cmd.Parameters("@A_MOD_ID").Value = A_MOD_ID
                cmd.Parameters("@A_AP_ID").Value = A_AP_ID
                cmd.Parameters("@A_AS_ID").Value = A_AS_ID
                cmd.Parameters("@A_COM_ID").Value = A_COM_ID
                cmd.Parameters("@A_CAT_ID").Value = A_CAT_ID
                cmd.Parameters("@A_TYPE_ID").Value = A_TYPE_ID
                cmd.Parameters("@A_SITE_ID").Value = A_SITE_ID
                cmd.Parameters("@A_Plant_Rate_Insitu").Value = A_Plant_Rate_Insitu
                cmd.Parameters("@A_Plant_Rate_Soils").Value = A_Plant_Rate_Soils
                cmd.Parameters("@A_Production_Rate").Value = A_Production_Rate
                cmd.Parameters("@A_Activity_Status").Value = A_Activity_Status
                cmd.Parameters("@A_Serial_No").Value = A_Serial_No
                cmd.Parameters("@A_Year").Value = A_Year
                cmd.Parameters("@A_Date_Purchase").Value = A_Date_Purchase
                cmd.Parameters("@A_Engine").Value = A_Engine
                cmd.Parameters("@A_Eng_SMU_1").Value = A_Eng_SMU_1
                cmd.Parameters("@A_Eng_SMU_2").Value = A_Eng_SMU_2
                cmd.Parameters("@A_Eng_Serial_1").Value = A_Eng_Serial_1
                cmd.Parameters("@A_Eng_Serial_2").Value = A_Eng_Serial_2
                cmd.Parameters("@A_Order_Number").Value = A_Order_Number
                cmd.Parameters("@A_Off_Hire_Number").Value = A_Off_Hire_Number
                cmd.Parameters("@A_Hire_ID").Value = A_Hire_ID
                cmd.Parameters("@A_HC_ID").Value = A_HC_ID
                cmd.Parameters("@A_Hire_Rate").Value = A_Hire_Rate
                cmd.Parameters("@A_Hire_Rate_External").Value = A_Hire_Rate_External
                cmd.Parameters("@A_Hire_Rate_Unit").Value = A_Hire_Rate_Unit
                cmd.Parameters("@A_Hire_Rate_Unit_External").Value = A_Hire_Rate_Unit_External
                cmd.Parameters("@A_Hours_Hire").Value = A_Hours_Hire
                cmd.Parameters("@A_Excess_Hour_Rate").Value = A_Excess_Hour_Rate
                cmd.Parameters("@A_Transport_Rate_On").Value = A_Transport_Rate_On
                cmd.Parameters("@A_Transport_Rate_Off").Value = A_Transport_Rate_Off
                cmd.Parameters("@A_Insurance_Value").Value = A_Insurance_Value
                cmd.Parameters("@A_Insurance_New_For_Old_Value").Value = A_Insurance_New_For_Old_Value
                cmd.Parameters("@A_Insurance_Status").Value = A_Insurance_Status
                cmd.Parameters("@A_Telemetry").Value = A_Telemetry
                cmd.Parameters("@A_Prime_Mover_Report").Value = A_Prime_Mover_Report
                cmd.Parameters("@A_Brake_Test").Value = A_Brake_Test
                cmd.Parameters("@A_Timesheet").Value = A_Timesheet
                cmd.Parameters("@A_SMU").Value = A_SMU
                cmd.Parameters("@A_Fuel").Value = A_Fuel
                cmd.Parameters("@A_Fuel_Type").Value = A_Fuel_Type
                cmd.Parameters("@A_Service").Value = A_Service
                cmd.Parameters("@A_Service_Status").Value = A_Service_Status
                cmd.Parameters("@A_Planning_Status").Value = A_Planning_Status
                cmd.Parameters("@A_Hire").Value = A_Hire
                cmd.Parameters("@A_Inspection").Value = A_Inspection
                cmd.Parameters("@A_Spec_Type").Value = A_Spec_Type
                cmd.Parameters("@A_Blade_Bucket_Size").Value = A_Blade_Bucket_Size
                cmd.Parameters("@A_Track_Tyre_Size").Value = A_Track_Tyre_Size
                cmd.Parameters("@A_Body_Type").Value = A_Body_Type
                cmd.Parameters("@A_Body_Capacity").Value = A_Body_Capacity
                cmd.Parameters("@A_Operating_Weight").Value = A_Operating_Weight
                cmd.Parameters("@A_Purchase_SMU").Value = A_Purchase_SMU
                cmd.Parameters("@A_Warranty_Expiry_Date").Value = A_Warranty_Expiry_Date
                cmd.Parameters("@A_Estimated_Disposal_Hours").Value = A_Estimated_Disposal_Hours
                cmd.Parameters("@A_Date_Sold").Value = A_Date_Sold
                cmd.Parameters("@A_Sold_SMU").Value = A_Sold_SMU
                cmd.Parameters("@A_CO_Emissions").Value = A_CO_Emissions
                cmd.Parameters("@A_Nox_Emissions").Value = A_Nox_Emissions
                cmd.Parameters("@A_HC_Emissions").Value = A_HC_Emissions
                cmd.Parameters("@A_Particulates").Value = A_Particulates
                cmd.Parameters("@A_External_Noise_dB").Value = A_External_Noise_dB
                cmd.Parameters("@A_External_Noise_Power").Value = A_External_Noise_Power
                cmd.Parameters("@A_Operator_Ear_dB").Value = A_Operator_Ear_dB
                cmd.Parameters("@A_Operator_Ear_Power").Value = A_Operator_Ear_Power
                cmd.Parameters("@A_Status").Value = A_Status
                cmd.Parameters("@A_Photo_Link").Value = A_Photo_Link
                cmd.Parameters("@A_QR_Link").Value = A_QR_Link
                cmd.Parameters("@A_Notes").Value = A_Notes
                cmd.Parameters("@A_Created_By").Value = A_Created_By
                cmd.Parameters("@A_Modified_By").Value = A_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SavePart(ByVal P_ID As Integer _
                                , ByVal P_Part_ID As String _
                                , ByVal P_MOD_ID As Integer _
                                , ByVal P_POS_ID As Integer _
                                , ByVal P_Level_3 As Integer _
                                , ByVal P_Status As String _
                                , ByVal P_Notes As String _
                                , ByVal P_Created_By As String _
                                , ByVal P_Modified_By As String _
                                , ByVal P_Disposal_Requested_By As String _
                                , ByVal P_Disposal_Approved_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_UPDATE_SP")
                cmd.Parameters("@P_ID").Value = P_ID
                cmd.Parameters("@P_Part_ID").Value = P_Part_ID
                cmd.Parameters("@P_MOD_ID").Value = P_MOD_ID
                cmd.Parameters("@P_POS_ID").Value = P_POS_ID
                cmd.Parameters("@P_Level_3").Value = P_Level_3
                cmd.Parameters("@P_Status").Value = P_Status
                cmd.Parameters("@P_Notes").Value = P_Notes
                cmd.Parameters("@P_Created_By").Value = P_Created_By
                cmd.Parameters("@P_Modified_By").Value = P_Modified_By
                cmd.Parameters("@P_Disposal_Requested_By").Value = P_Disposal_Requested_By
                cmd.Parameters("@P_Disposal_Approved_By").Value = P_Disposal_Approved_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SavePartRequest(ByVal PR_ID As Integer _
                                , ByVal PR_A_ID As String _
                                , ByVal PR_MOD_ID As Integer _
                                , ByVal PR_Code_Level_3 As Integer _
                                , ByVal PR_Stock As Integer _
                                , ByVal PR_Reason As String _
                                , ByVal PR_Status As String _
                                , ByVal PR_Rejection_Notes As String _
                                , ByVal PR_Created_By As String _
                                , ByVal PR_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_UPDATE_REQUEST_SP")
                cmd.Parameters("@PR_ID").Value = PR_ID
                cmd.Parameters("@PR_A_ID").Value = PR_A_ID
                cmd.Parameters("@PR_MOD_ID").Value = PR_MOD_ID
                cmd.Parameters("@PR_Code_Level_3").Value = PR_Code_Level_3
                cmd.Parameters("@PR_Stock").Value = PR_Stock
                cmd.Parameters("@PR_Reason").Value = PR_Reason
                cmd.Parameters("@PR_Status").Value = PR_Status
                cmd.Parameters("@PR_Rejection_Notes").Value = PR_Rejection_Notes
                cmd.Parameters("@PR_Created_By").Value = PR_Created_By
                cmd.Parameters("@PR_Modified_By").Value = PR_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SavePartMovement(ByVal PD_P_ID As Integer _
                                , ByVal PD_Location_ID As Integer _
                                , ByVal LocationType As String _
                                , ByVal PD_Location_Date As DateTime _
                                , ByVal PD_POS_ID As Integer _
                                , ByVal PD_Expected_Days As Integer _
                                , ByVal PD_Created_By As String _
                                , ByVal PD_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_INSERT_MOVEMENT_SP")
                cmd.Parameters("@PD_P_ID").Value = PD_P_ID
                cmd.Parameters("@PD_Location_ID").Value = PD_Location_ID
                cmd.Parameters("@LocationType").Value = LocationType
                cmd.Parameters("@PD_Location_Date").Value = PD_Location_Date
                cmd.Parameters("@PD_POS_ID").Value = PD_POS_ID
                cmd.Parameters("@PD_Expected_Days").Value = PD_Expected_Days
                cmd.Parameters("@PD_Created_By").Value = PD_Created_By
                cmd.Parameters("@PD_Modified_By").Value = PD_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveMagPlugs(ByVal MPI_ID As String _
                                , ByVal MPI_CUS_ID As Integer _
                                , ByVal MPI_A_ID As Integer _
                                , ByVal MPI_CP_ID As Integer _
                                , ByVal MPI_VR_ID As Integer _
                                , ByVal MPI_INS_ID As Integer _
                                , ByVal MPI_SMU As Integer _
                                , ByVal MPI_Photo_Link As String _
                                , ByVal MPI_Date As DateTime _
                                , ByVal MPI_Status As String _
                                , ByVal MPI_Created_By As String _
                                , ByVal MPI_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_MAGNETIC_PLUG_INSPECTIONS_UPDATE_SP")
                cmd.Parameters("@MPI_ID").Value = MPI_ID
                cmd.Parameters("@MPI_CUS_ID").Value = MPI_CUS_ID
                cmd.Parameters("@MPI_A_ID").Value = MPI_A_ID
                cmd.Parameters("@MPI_CP_ID").Value = MPI_CP_ID
                cmd.Parameters("@MPI_VR_ID").Value = MPI_VR_ID
                cmd.Parameters("@MPI_INS_ID").Value = MPI_INS_ID
                cmd.Parameters("@MPI_SMU").Value = MPI_SMU
                cmd.Parameters("@MPI_Photo_Link").Value = MPI_Photo_Link
                cmd.Parameters("@MPI_Date").Value = MPI_Date
                cmd.Parameters("@MPI_Status").Value = MPI_Status
                cmd.Parameters("@MPI_Created_By").Value = MPI_Created_By
                cmd.Parameters("@MPI_Modified_By").Value = MPI_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveBrakeTest(ByVal BRK_ID As Integer _
                                , ByVal BRK_CUS_ID As Integer _
                                , ByVal BRK_SITE_ID As Integer _
                                , ByVal BRK_A_ID As Integer _
                                , ByVal BRK_Engineer_ID As Integer _
                                , ByVal BRK_Date As DateTime _
                                , ByVal BRK_Ground_Condition As String _
                                , ByVal BRK_SMU As Integer _
                                , ByVal BRK_Value As Decimal _
                                , ByVal BRK_Retest_Value As Decimal _
                                , ByVal BRK_HandBrake As Integer _
                                , ByVal BRK_HandBrake_Retest As Integer _
                                , ByVal BRK_Notes As String _
                                , ByVal BRK_Status As String _
                                , ByVal BRK_Created_By As String _
                                , ByVal BRK_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_RW_SAVE_BRAKETEST")
                cmd.Parameters("@BRK_ID").Value = BRK_ID
                cmd.Parameters("@BRK_CUS_ID").Value = BRK_CUS_ID
                cmd.Parameters("@BRK_SITE_ID").Value = BRK_SITE_ID
                cmd.Parameters("@BRK_A_ID").Value = BRK_A_ID
                cmd.Parameters("@BRK_Engineer_ID").Value = BRK_Engineer_ID
                cmd.Parameters("@BRK_Date").Value = BRK_Date
                cmd.Parameters("@BRK_Ground_Condition").Value = BRK_Ground_Condition
                cmd.Parameters("@BRK_SMU").Value = BRK_SMU
                cmd.Parameters("@BRK_Value").Value = BRK_Value
                cmd.Parameters("@BRK_Retest_Value").Value = BRK_Retest_Value
                cmd.Parameters("@BRK_HandBrake").Value = BRK_HandBrake
                cmd.Parameters("@BRK_HandBrake_Retest").Value = BRK_HandBrake_Retest
                cmd.Parameters("@BRK_Notes").Value = BRK_Notes
                cmd.Parameters("@BRK_Status").Value = BRK_Status
                cmd.Parameters("@BRK_Created_By").Value = BRK_Created_By
                cmd.Parameters("@BRK_Modified_By").Value = BRK_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveEvent(ByVal E_ID As Integer _
                                , ByVal E_CUS_ID As Integer _
                                , ByVal E_SITE_ID As Integer _
                                , ByVal E_A_ID As Integer _
                                , ByVal E_EC_ID As Integer _
                                , ByVal E_ET_ID As Integer _
                                , ByVal E_Engineer_ID As Integer _
                                , ByVal E_Description As String _
                                , ByVal E_Date_Estimated As DateTime _
                                , ByVal E_Date_Started As DateTime _
                                , ByVal E_Planned_Start_Date As DateTime _
                                , ByVal E_Date_From As DateTime _
                                , ByVal E_Months As Integer _
                                , ByVal E_Date_To As DateTime _
                                , ByVal E_Payment_Terms As String _
                                , ByVal E_Special_Note As String _
                                , ByVal E_Date_Ended As DateTime _
                                , ByVal E_Status As String _
                                , ByVal E_Notes As String _
                                , ByVal E_Subtotal As String _
                                , ByVal E_Discount As String _
                                , ByVal E_Total As String _
                                , ByVal E_ReOpen As String _
                                , ByVal E_Created_By As String _
                                , ByVal E_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_RG_UPDATE_SP")
                cmd.Parameters("@E_ID").Value = E_ID
                cmd.Parameters("@E_CUS_ID").Value = E_CUS_ID
                cmd.Parameters("@E_SITE_ID").Value = E_SITE_ID
                cmd.Parameters("@E_A_ID").Value = E_A_ID
                cmd.Parameters("@E_EC_ID").Value = E_EC_ID
                cmd.Parameters("@E_ET_ID").Value = E_ET_ID
                cmd.Parameters("@E_Engineer_ID").Value = E_Engineer_ID
                cmd.Parameters("@E_Description").Value = E_Description
                cmd.Parameters("@E_Date_Estimated").Value = E_Date_Estimated
                cmd.Parameters("@E_Date_Started").Value = E_Date_Started
                cmd.Parameters("@E_Planned_Start_Date").Value = E_Planned_Start_Date
                cmd.Parameters("@E_Date_From").Value = E_Date_From
                cmd.Parameters("@E_Months").Value = E_Months
                cmd.Parameters("@E_Date_To").Value = E_Date_To
                cmd.Parameters("@E_Payment_Terms").Value = E_Payment_Terms
                cmd.Parameters("@E_Special_Note").Value = E_Special_Note
                cmd.Parameters("@E_Date_Ended").Value = E_Date_Ended
                cmd.Parameters("@E_Status").Value = E_Status
                cmd.Parameters("@E_Notes").Value = E_Notes
                cmd.Parameters("@E_Subtotal").Value = E_Subtotal
                cmd.Parameters("@E_Discount").Value = E_Discount
                cmd.Parameters("@E_Total").Value = E_Total
                cmd.Parameters("@E_ReOpen").Value = E_ReOpen
                cmd.Parameters("@E_Created_By").Value = E_Created_By
                cmd.Parameters("@E_Modified_By").Value = E_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveJob(ByVal J_ID As Integer _
                                , ByVal J_E_ID As Integer _
                                , ByVal J_JT_ID As Integer _
                                , ByVal J_Code_Level_1 As Integer _
                                , ByVal J_Code_Level_2 As Integer _
                                , ByVal J_Code_Level_3 As Integer _
                                , ByVal J_INC_CODE As Integer _
                                , ByVal J_Planned_Start_Date As DateTime _
                                , ByVal J_Engineer_ID As Integer _
                                , ByVal J_Date_Closed As DateTime _
                                , ByVal J_SMU As String _
                                , ByVal J_Estimated_Time As String _
                                , ByVal J_Instruction As String _
                                , ByVal J_Status As String _
                                , ByVal J_Notes As String _
                                , ByVal J_QEF_Event_Flag As Integer _
                                , ByVal J_Created_By As String _
                                , ByVal J_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_JOBS_RG_UPDATE_SP")
                cmd.Parameters("@J_ID").Value = J_ID
                cmd.Parameters("@J_E_ID").Value = J_E_ID
                cmd.Parameters("@J_JT_ID").Value = J_JT_ID
                cmd.Parameters("@J_Code_Level_1").Value = J_Code_Level_1
                cmd.Parameters("@J_Code_Level_2").Value = J_Code_Level_2
                cmd.Parameters("@J_Code_Level_3").Value = J_Code_Level_3
                cmd.Parameters("@J_INC_CODE").Value = J_INC_CODE
                cmd.Parameters("@J_Planned_Start_Date").Value = J_Planned_Start_Date
                cmd.Parameters("@J_Engineer_ID").Value = J_Engineer_ID
                cmd.Parameters("@J_Date_Closed").Value = J_Date_Closed
                cmd.Parameters("@J_SMU").Value = J_SMU
                cmd.Parameters("@J_Estimated_Time").Value = J_Estimated_Time
                cmd.Parameters("@J_Instruction").Value = J_Instruction
                cmd.Parameters("@J_Status").Value = J_Status
                cmd.Parameters("@J_Notes").Value = J_Notes
                cmd.Parameters("@J_QEF_Event_Flag").Value = J_QEF_Event_Flag
                cmd.Parameters("@J_Created_By").Value = J_Created_By
                cmd.Parameters("@J_Modified_By").Value = J_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveFT(ByVal FT_ID As Integer _
                                , ByVal FT_J_ID As Integer _
                                , ByVal FT_Status As String _
                                , ByVal FT_Notes As String _
                                , ByVal FT_Issues_Notes As String _
                                , ByVal FT_Tests_Notes As String _
                                , ByVal FT_Created_By As String _
                                , ByVal FT_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_FT_RG_UPDATE_SP")
                cmd.Parameters("@FT_ID").Value = FT_ID
                cmd.Parameters("@FT_J_ID").Value = FT_J_ID
                cmd.Parameters("@FT_Status").Value = FT_Status
                cmd.Parameters("@FT_Notes").Value = FT_Notes
                cmd.Parameters("@FT_Issues_Notes").Value = FT_Issues_Notes
                cmd.Parameters("@FT_Tests_Notes").Value = FT_Tests_Notes
                cmd.Parameters("@FT_Created_By").Value = FT_Created_By
                cmd.Parameters("@FT_Modified_By").Value = FT_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveFTD(ByVal FTD_ID As Integer _
                                , ByVal FTD_J_ID As Integer _
                                , ByVal FTD_Engineer_ID As Integer _
                                , ByVal FTD_Start_Location As String _
                                , ByVal FTD_Start_Time As DateTime _
                                , ByVal FTD_Start_Mileage As String _
                                , ByVal FTD_Job_Start_Time As DateTime _
                                , ByVal FTD_Job_End_Time As DateTime _
                                , ByVal FTD_Return_Mileage As String _
                                , ByVal FTD_End_Time As DateTime _
                                , ByVal FTD_Breaks As String _
                                , ByVal FTD_End_Location As String _
                                , ByVal FTD_Status As String _
                                , ByVal FTD_Created_By As String _
                                , ByVal FTD_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_FTD_RG_UPDATE_SP")
                cmd.Parameters("@FTD_ID").Value = FTD_ID
                cmd.Parameters("@FTD_J_ID").Value = FTD_J_ID
                cmd.Parameters("@FTD_Engineer_ID").Value = FTD_Engineer_ID
                cmd.Parameters("@FTD_Start_Location").Value = FTD_Start_Location
                cmd.Parameters("@FTD_Start_Time").Value = FTD_Start_Time
                cmd.Parameters("@FTD_Start_Mileage").Value = FTD_Start_Mileage
                cmd.Parameters("@FTD_Job_Start_Time").Value = FTD_Job_Start_Time
                cmd.Parameters("@FTD_Job_End_Time").Value = FTD_Job_End_Time
                cmd.Parameters("@FTD_Return_Mileage").Value = FTD_Return_Mileage
                cmd.Parameters("@FTD_End_Time").Value = FTD_End_Time
                cmd.Parameters("@FTD_Breaks").Value = FTD_Breaks
                cmd.Parameters("@FTD_End_Location").Value = FTD_End_Location
                cmd.Parameters("@FTD_Status").Value = FTD_Status
                cmd.Parameters("@FTD_Created_By").Value = FTD_Created_By
                cmd.Parameters("@FTD_Modified_By").Value = FTD_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveEI(ByVal EI_ID As Integer _
                                , ByVal EI_E_ID As Integer _
                                , ByVal EI_Level_3 As Integer _
                                , ByVal EI_Name As String _
                                , ByVal EI_Qty As String _
                                , ByVal EI_Rate As String _
                                , ByVal EI_Markup As String _
                                , ByVal EI_Total As String _
                                , ByVal EI_Qty_Used As String _
                                , ByVal EI_Status As String _
                                , ByVal EI_Created_By As String _
                                , ByVal EI_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_ITEMS_RG_UPDATE_SP")
                cmd.Parameters("@EI_ID").Value = EI_ID
                cmd.Parameters("@EI_E_ID").Value = EI_E_ID
                cmd.Parameters("@EI_Level_3").Value = EI_Level_3
                cmd.Parameters("@EI_Name").Value = EI_Name
                cmd.Parameters("@EI_Qty").Value = EI_Qty
                cmd.Parameters("@EI_Rate").Value = EI_Rate
                cmd.Parameters("@EI_Markup").Value = EI_Markup
                cmd.Parameters("@EI_Total").Value = EI_Total
                cmd.Parameters("@EI_Qty_Used").Value = EI_Qty_Used
                cmd.Parameters("@EI_Status").Value = EI_Status
                cmd.Parameters("@EI_Created_By").Value = EI_Created_By
                cmd.Parameters("@EI_Modified_By").Value = EI_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveContact(ByVal CON_ID As Integer _
                                , ByVal CON_Name As String _
                                , ByVal CON_CUS_ID As Integer _
                                , ByVal CON_SITE_ID As Integer _
                                , ByVal CON_Position As String _
                                , ByVal CON_Level As String _
                                , ByVal CON_Phone As String _
                                , ByVal CON_Email As String _
                                , ByVal CON_Status As String _
                                , ByVal CON_Created_By As String _
                                , ByVal CON_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CONTACT_LIST_RG_UPDATE_SP")
                cmd.Parameters("@CON_ID").Value = CON_ID
                cmd.Parameters("@CON_Name").Value = CON_Name
                cmd.Parameters("@CON_CUS_ID").Value = CON_CUS_ID
                cmd.Parameters("@CON_SITE_ID").Value = CON_SITE_ID
                cmd.Parameters("@CON_Position").Value = CON_Position
                cmd.Parameters("@CON_Level").Value = CON_Level
                cmd.Parameters("@CON_Phone").Value = CON_Phone
                cmd.Parameters("@CON_Email").Value = CON_Email
                cmd.Parameters("@CON_Status").Value = CON_Status
                cmd.Parameters("@CON_Created_By").Value = CON_Created_By
                cmd.Parameters("@CON_Modified_By").Value = CON_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveCustomer(ByVal CUS_ID As Integer _
                                , ByVal CUS_Name As String _
                                , ByVal CUS_Company_Number As String _
                                , ByVal CUS_Code As String _
                                , ByVal CUS_Phone As String _
                                , ByVal CUS_Website As String _
                                , ByVal CUS_Email As String _
                                , ByVal CUS_Address_1 As String _
                                , ByVal CUS_Address_2 As String _
                                , ByVal CUS_Address_3 As String _
                                , ByVal CUS_City As String _
                                , ByVal CUS_County As String _
                                , ByVal CUS_Postcode As String _
                                , ByVal CUS_Discount As String _
                                , ByVal CUS_Status As String _
                                , ByVal CUS_Notes As String _
                                , ByVal CUS_Created_By As String _
                                , ByVal CUS_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_LIST_RG_UPDATE_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@CUS_Name").Value = CUS_Name
                cmd.Parameters("@CUS_Company_Number").Value = CUS_Company_Number
                cmd.Parameters("@CUS_Code").Value = CUS_Code
                cmd.Parameters("@CUS_Phone").Value = CUS_Phone
                cmd.Parameters("@CUS_Website").Value = CUS_Website
                cmd.Parameters("@CUS_Email").Value = CUS_Email
                cmd.Parameters("@CUS_Address_1").Value = CUS_Address_1
                cmd.Parameters("@CUS_Address_2").Value = CUS_Address_2
                cmd.Parameters("@CUS_Address_3").Value = CUS_Address_3
                cmd.Parameters("@CUS_City").Value = CUS_City
                cmd.Parameters("@CUS_County").Value = CUS_County
                cmd.Parameters("@CUS_Postcode").Value = CUS_Postcode
                cmd.Parameters("@CUS_Discount").Value = CUS_Discount
                cmd.Parameters("@CUS_Status").Value = CUS_Status
                cmd.Parameters("@CUS_Notes").Value = CUS_Notes
                cmd.Parameters("@CUS_Created_By").Value = CUS_Created_By
                cmd.Parameters("@CUS_Modified_By").Value = CUS_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveCustomerSatisfaction(ByVal CS_ID As Integer _
                                , ByVal CS_CUS_ID As Integer _
                                , ByVal CS_Engineer_ID As Integer _
                                , ByVal CS_Q1 As Integer _
                                , ByVal CS_Q2 As Integer _
                                , ByVal CS_Q3 As Integer _
                                , ByVal CS_Q4 As Integer _
                                , ByVal CS_Q5 As Integer _
                                , ByVal CS_Q6 As Integer _
                                , ByVal CS_Q7 As Integer _
                                , ByVal CS_Q8 As Integer _
                                , ByVal CS_Q9 As Integer _
                                , ByVal CS_Q10 As Integer _
                                , ByVal CS_Q11 As Integer _
                                , ByVal CS_Q12 As Integer _
                                , ByVal CS_Q13 As Integer _
                                , ByVal CS_Q14 As Integer _
                                , ByVal CS_Notes As String _
                                , ByVal CS_Status As String _
                                , ByVal CS_Created_By As String _
                                , ByVal CS_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_SATISFACTION_SURVEY_RG_UPDATE_SP")
                cmd.Parameters("@CS_ID").Value = CS_ID
                cmd.Parameters("@CS_CUS_ID").Value = CS_CUS_ID
                cmd.Parameters("@CS_Engineer_ID").Value = CS_Engineer_ID
                cmd.Parameters("@CS_Q1").Value = CS_Q1
                cmd.Parameters("@CS_Q2").Value = CS_Q2
                cmd.Parameters("@CS_Q3").Value = CS_Q3
                cmd.Parameters("@CS_Q4").Value = CS_Q4
                cmd.Parameters("@CS_Q5").Value = CS_Q5
                cmd.Parameters("@CS_Q6").Value = CS_Q6
                cmd.Parameters("@CS_Q7").Value = CS_Q7
                cmd.Parameters("@CS_Q8").Value = CS_Q8
                cmd.Parameters("@CS_Q9").Value = CS_Q9
                cmd.Parameters("@CS_Q10").Value = CS_Q10
                cmd.Parameters("@CS_Q11").Value = CS_Q11
                cmd.Parameters("@CS_Q12").Value = CS_Q12
                cmd.Parameters("@CS_Q13").Value = CS_Q13
                cmd.Parameters("@CS_Q14").Value = CS_Q14
                cmd.Parameters("@CS_Notes").Value = CS_Notes
                cmd.Parameters("@CS_Status").Value = CS_Status
                cmd.Parameters("@CS_Created_By").Value = CS_Created_By
                cmd.Parameters("@CS_Modified_By").Value = CS_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Sub SaveSite(ByVal SITE_ID As Integer _
                                , ByVal SITE_CUS_ID As Integer _
                                , ByVal SITE_Name As String _
                                , ByVal SITE_Address_Type As String _
                                , ByVal SITE_Address_1 As String _
                                , ByVal SITE_Address_2 As String _
                                , ByVal SITE_Address_3 As String _
                                , ByVal SITE_City As String _
                                , ByVal SITE_County As String _
                                , ByVal SITE_Postcode As String _
                                , ByVal SITE_Lat As String _
                                , ByVal SITE_Lon As String _
                                , ByVal SITE_Status As String _
                                , ByVal SITE_Created_By As String _
                                , ByVal SITE_Modified_By As String)
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_SITE_LIST_RG_UPDATE_SP")
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@SITE_CUS_ID").Value = SITE_CUS_ID
                cmd.Parameters("@SITE_Name").Value = SITE_Name
                cmd.Parameters("@SITE_Address_Type").Value = SITE_Address_Type
                cmd.Parameters("@SITE_Address_1").Value = SITE_Address_1
                cmd.Parameters("@SITE_Address_2").Value = SITE_Address_2
                cmd.Parameters("@SITE_Address_3").Value = SITE_Address_3
                cmd.Parameters("@SITE_City").Value = SITE_City
                cmd.Parameters("@SITE_County").Value = SITE_County
                cmd.Parameters("@SITE_Postcode").Value = SITE_Postcode
                cmd.Parameters("@SITE_Lat").Value = SITE_Lat
                cmd.Parameters("@SITE_Lon").Value = SITE_Lon
                cmd.Parameters("@SITE_Status").Value = SITE_Status
                cmd.Parameters("@SITE_Created_By").Value = SITE_Created_By
                cmd.Parameters("@SITE_Modified_By").Value = SITE_Modified_By
                dbConnection.ExecuteNonQuery(cmd)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Sub
        Public Function GetThresholdFromWidget(ByVal WT_Area As String, ByVal WT_No As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetThresholdFromWidget")
                cmd.Parameters("@WT_Area").Value = WT_Area
                cmd.Parameters("@WT_No").Value = WT_No
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GET_CUSTOMER_PREFERENCES(ByVal CUS_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GET_CUSTOMER_PREFERENCES")
                cmd.Parameters("@Customer").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function ADMIN_ASSET_RG_ATTRIBUTES_SELECT_RW_SP(ByVal ATT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_ASSET_RG_ATTRIBUTES_SELECT_RW_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function ADMIN_EVENT_RG_ATTRIBUTES_SELECT_RW_SP(ByVal ATT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_EVENT_RG_ATTRIBUTES_SELECT_RW_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function ADMIN_OTHER_RG_ATTRIBUTES_SELECT_RW_SP(ByVal ATT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_OTHER_RG_ATTRIBUTES_SELECT_RW_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function ADMIN_SMU_RG_ATTRIBUTES_SELECT_RW_SP(ByVal ATT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ADMIN_SMU_RG_ATTRIBUTES_SELECT_RW_SP")
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function ENGINEER_DETAILS_SELECT_RW_SP(ByVal ENGD_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("ENGINEER_DETAILS_SELECT_RW_SP")
                cmd.Parameters("@ENGD_ID").Value = ENGD_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function D_ASSET_DETAILS_SP(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_DETAILS_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function D_ASSET_ALL_EVENTS_RG_SELECT_SP(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ALL_EVENTS_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_ACTIVE_JOBS_RG_SELECT_SP(ByVal E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_ACTIVE_JOBS_RG_SELECT_SP")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_EVENTS_RG_SELECT_SP(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal A_ID As Integer, ByVal ATT_ID As Integer, ByVal PER_EMP_ID As Integer, ByVal E_Description As String, ByVal ActiveOrPlanning As Boolean) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_RG_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_Description").Value = E_Description
                cmd.Parameters("@ActiveOrPlanning").Value = ActiveOrPlanning
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function D_ASSET_ARCHIVE_JOBS_RG_SELECT_SP(ByVal A_ID As Integer, ByVal SITE_ID As Integer, ByVal ATT_ID As Integer, ByVal J_Status As String, ByVal PER_EMP_ID As Integer, ByVal E_ID As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ARCHIVE_JOBS_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@ATT_ID").Value = ATT_ID
                cmd.Parameters("@J_Status").Value = J_Status
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function D_ASSET_ALL_SER_RG_SELECT_SP(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_ASSET_ALL_SER_RG_SELECT_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function D_EVENT_PLANNING_CALENDAR_SELECT_SP(ByVal CUS_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("D_EVENT_PLANNING_CALENDAR_SELECT_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function DATA_INPUT_MAGNETIC_PLUG_INSPECTIONS_SELECT_RW_SP(ByVal MPI_ID As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_MAGNETIC_PLUG_INSPECTIONS_SELECT_RW_SP")
                cmd.Parameters("@MPI_ID").Value = MPI_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function DATA_INPUT_RG_BRAKETEST_RW_SP(ByVal BRK_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("DATA_INPUT_RG_BRAKETEST_RW_SP")
                cmd.Parameters("@BRK_ID").Value = BRK_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function AM_ASSET_LIST_RG_SELECT_RW_SP(ByVal A_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_ASSET_LIST_RG_SELECT_RW_SP")
                cmd.Parameters("@A_ID").Value = A_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function AM_PART_LIST_RG_SELECT_RW_SP(ByVal P_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_SELECT_RW_SP")
                cmd.Parameters("@P_ID").Value = P_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function AM_PART_LIST_RG_REQUEST_SELECT_RW_SP(ByVal PR_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("AM_PART_LIST_RG_REQUEST_SELECT_RW_SP")
                cmd.Parameters("@PR_ID").Value = PR_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetMagPlugDataTable(ByVal Customer As Integer, ByVal Asset As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime, ByVal Compartment As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetMagPlugIns_SummaryReport_Asset")
                cmd.Parameters("@Customer").Value = Customer
                cmd.Parameters("@Asset").Value = Asset
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                cmd.Parameters("@Compartment").Value = Compartment
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function GetEngineerJobsGridData_Widgets(ByVal CUS_ID As Integer, ByVal SITE_ID As Integer, ByVal PER_EMP_ID As String, ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("GetEngineerJobsGridData_Widgets")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                cmd.Parameters("@PER_EMP_ID").Value = PER_EMP_ID
                cmd.Parameters("@DateFrom").Value = DateFrom
                cmd.Parameters("@DateTo").Value = DateTo
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_EVENTS_RG_SELECT_RW_SP(ByVal E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_RG_SELECT_RW_SP")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_JOBS_RG_SELECT_RW_SP(ByVal J_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_JOBS_RG_SELECT_RW_SP")
                cmd.Parameters("@J_ID").Value = J_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_FT_RG_SELECT_RW_SP(ByVal FT_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_FT_RG_SELECT_RW_SP")
                cmd.Parameters("@FT_ID").Value = FT_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_FTD_RG_SELECT_RW_SP(ByVal FTD_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_FTD_RG_SELECT_RW_SP")
                cmd.Parameters("@FTD_ID").Value = FTD_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_EVENTS_ITEMS_RG_SELECT_RW_SP(ByVal EI_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_EVENTS_ITEMS_RG_SELECT_RW_SP")
                cmd.Parameters("@EI_ID").Value = EI_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_JOBS_SET_SMU(ByVal E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_JOBS_SET_SMU")
                cmd.Parameters("@E_ID").Value = E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function EM_JOBS_CLOSE_STATUS(ByVal J_E_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("EM_JOBS_CLOSE_STATUS")
                cmd.Parameters("@J_E_ID").Value = J_E_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function CM_CONTACT_LIST_RG_SELECT_RW_SP(ByVal CON_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CONTACT_LIST_RG_SELECT_RW_SP")
                cmd.Parameters("@CON_ID").Value = CON_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function CM_CUSTOMER_LIST_RG_SELECT_RW_SP(ByVal CUS_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_LIST_RG_SELECT_RW_SP")
                cmd.Parameters("@CUS_ID").Value = CUS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function CM_SITE_LIST_RG_SELECT_RW_SP(ByVal SITE_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_SITE_LIST_RG_SELECT_RW_SP")
                cmd.Parameters("@SITE_ID").Value = SITE_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function CM_CUSTOMER_SATISFACTION_SURVEY_RG_SELECT_RW_SP(ByVal CS_ID As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("CM_CUSTOMER_SATISFACTION_SURVEY_RG_SELECT_RW_SP")
                cmd.Parameters("@CS_ID").Value = CS_ID
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_AVERAGE_ENGINEER_UTILISATION_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_AVERAGE_ENGINEER_UTILISATION_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_AVERAGE_ENGINEER_UTILISATION_LW_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_AVERAGE_ENGINEER_UTILISATION_LW_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_CORRECT_PARTS_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_CORRECT_PARTS_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_CORRECT_PARTS_LW_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_CORRECT_PARTS_LW_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_FIRST_TIME_FIX_RATIO_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_FIRST_TIME_FIX_RATIO_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_FIRST_TIME_FIX_RATIO_LW_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_FIRST_TIME_FIX_RATIO_LW_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_JOB_COMPLETION_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_JOB_COMPLETION_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_JOB_COMPLETION_LW_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_JOB_COMPLETION_LW_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_CUSTOMER_SERVICE_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_CUSTOMER_SERVICE_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
        Public Function Widget_HOME_CUSTOMER_SERVICE_LW_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'JS  21/02/2019   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess
                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)
                dbConnection.ConnectionString = mConnectionString
                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand
                cmd = dbConnection.GetCommand("Widget_HOME_CUSTOMER_SERVICE_LW_SP")
                Dim ds As DataSet = dbConnection.RetrieveDataset(cmd)
                Return ds.Tables(0)
            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)
            End Try
        End Function
#End Region
#Region "Internal Methods"

#End Region
    End Class
End Namespace

