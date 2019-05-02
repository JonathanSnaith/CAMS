Imports System
Imports System.Collections.Generic
Imports System.Text
Imports System.Net
Imports System.Xml
Imports System.Collections.Specialized
Imports System.Data.SqlClient
Imports System.Data

Namespace Database

    Public Class Query


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
        Public Function ADMIN_ASSET_CB_ATTRIBUTES_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("ADMIN_ASSET_CB_ATTRIBUTES_SP")

                'cmd.Parameters("@System").Value = Param


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_SITENAMES_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_SITENAMES_SP")

                'cmd.Parameters("@System").Value = Param


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_CHECKEDBY_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_CHECKEDBY_SP")
                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_CB_FUELCHECKEDBY_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_FUELCHECKEDBY_SP")
                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_BRAKECHECKEDBY_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_BRAKECHECKEDBY_SP")
                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_CB_WEEKENDINGS_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_WEEKENDINGS_SP")

                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Sub DATA_INPUT_RW_SAVE_SMU(ByVal SMU_Id As Integer _
                                                    , ByVal SMU_Value As Integer _
                                                    , ByVal SMU_Pay_Load As Integer _
                                                    , ByVal SMU_Notes As String _
                                                    , ByVal SMU_ModifiedBy As String _
                                                    , ByVal SMU_CheckedBy As String)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RW_SAVE_SMU")

                cmd.Parameters("@SMU_Id").Value = SMU_Id
                cmd.Parameters("@SMU_Value").Value = SMU_Value
                cmd.Parameters("@SMU_Pay_Load").Value = SMU_Pay_Load
                cmd.Parameters("@SMU_Notes").Value = SMU_Notes
                cmd.Parameters("@SMU_ModifiedBy").Value = SMU_ModifiedBy
                cmd.Parameters("@SMU_CheckedBy").Value = SMU_CheckedBy

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Sub DATA_INPUT_RW_SAVE_FUEL(ByVal FUEL_Id As Integer _
                                            , ByVal FUEL_Quantity As Integer _
                                            , ByVal FUEL_Notes As String _
                                            , ByVal FUEL_ModifiedBy As String _
                                            , ByVal FUEL_CheckedBy As String)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RW_SAVE_FUEL")

                cmd.Parameters("@FUEL_Id").Value = FUEL_Id
                cmd.Parameters("@FUEL_Quantity").Value = FUEL_Quantity
                cmd.Parameters("@FUEL_Notes").Value = FUEL_Notes
                cmd.Parameters("@FUEL_ModifiedBy").Value = FUEL_ModifiedBy
                cmd.Parameters("@FUEL_CheckedBy").Value = FUEL_CheckedBy

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Sub DATA_INPUT_RW_SAVE_BRAKETEST(ByVal BRK_Id As Integer _
                                      , ByVal BRK_Ground_Condition As String _
                                      , ByVal BRK_SMU As Integer _
                                      , ByVal BRK_Value As Decimal _
                                      , ByVal BRK_Retest_Value As Decimal _
                                      , ByVal BRK_HandBrake As Integer _
                                      , ByVal BRK_HandBrake_Retest As Integer _
                                      , ByVal BRK_Notes As String _
                                      , ByVal BRK_Status As String _
                                      , ByVal BRK_ModifiedBy As String)

            ' , ByVal BRK_CheckedBy As String)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
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

                cmd.Parameters("@BRK_Id").Value = BRK_Id
                cmd.Parameters("@BRK_Ground_Condition").Value = BRK_Ground_Condition
                cmd.Parameters("@BRK_SMU").Value = BRK_SMU
                cmd.Parameters("@BRK_Value").Value = BRK_Value
                cmd.Parameters("@BRK_Retest_Value").Value = BRK_Retest_Value
                cmd.Parameters("@BRK_HandBrake").Value = BRK_HandBrake
                cmd.Parameters("@BRK_HandBrake_Retest").Value = BRK_HandBrake_Retest
                cmd.Parameters("@BRK_Notes").Value = BRK_Notes
                cmd.Parameters("@BRK_Status").Value = BRK_Status
                cmd.Parameters("@BRK_ModifiedBy").Value = BRK_ModifiedBy
                'cmd.Parameters("@BRK_CheckedBy").Value = BRK_CheckedBy

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Sub DATA_INPUT_RW_SAVE_ACTIVITY(ByVal Action As String _
                                            , ByVal PLT_Id As Integer _
                                            , ByVal PLT_Operator_ID As Integer _
                                            , ByVal ATT_Name As String _
                                            , ByVal PLT_Work_Hours As Decimal _
                                            , ByVal PLT_PTC_ID As Integer _
                                            , ByVal PLT_Travel As Decimal _
                                            , ByVal PLT_Breakdown As Decimal _
                                            , ByVal PLT_Weather As Decimal _
                                            , ByVal PLT_Blasting As Decimal _
                                            , ByVal PLT_Maintenance As Decimal _
                                            , ByVal PLT_Bait As Decimal _
                                            , ByVal PLT_Not_Working As Decimal _
                                            , ByVal PLT_BreakdownNotes As String _
                                            , ByVal PLT_Notes As String _
                                            , ByVal PLT_ModifiedBy As String)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RW_SAVE_ACTIVITY")

                cmd.Parameters("@Action").Value = Action
                cmd.Parameters("@PLT_Id").Value = PLT_Id
                cmd.Parameters("@PLT_Operator_ID").Value = PLT_Operator_ID
                cmd.Parameters("@ATT_Name").Value = ATT_Name
                cmd.Parameters("@PLT_Work_Hours").Value = PLT_Work_Hours
                cmd.Parameters("@PLT_PTC_ID").Value = PLT_PTC_ID
                cmd.Parameters("@PLT_Travel").Value = PLT_Travel
                cmd.Parameters("@PLT_Breakdown").Value = PLT_Breakdown
                cmd.Parameters("@PLT_Weather").Value = PLT_Weather
                cmd.Parameters("@PLT_Blasting").Value = PLT_Blasting
                cmd.Parameters("@PLT_Maintenance").Value = PLT_Maintenance
                cmd.Parameters("@PLT_Bait").Value = PLT_Bait
                cmd.Parameters("@PLT_Not_Working").Value = PLT_Not_Working
                cmd.Parameters("@PLT_BreakdownNotes").Value = PLT_BreakdownNotes
                cmd.Parameters("@PLT_Notes").Value = PLT_Notes
                cmd.Parameters("@PLT_ModifiedBy").Value = PLT_ModifiedBy

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Sub DATA_INPUT_RW_DELETE_ACTIVITY(ByVal PLT_Id As Integer)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RW_DELETE_ACTIVITY")

                cmd.Parameters("@PLT_Id").Value = PLT_Id

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Sub EM_JOBS_RG_UPDATE_SP(ByVal J_ID As Integer _
                                    , ByVal J_E_ID As String _
                                    , ByVal J_JT_ID As String _
                                    , ByVal J_COG_ID As String _
                                    , ByVal J_Handler As String _
                                    , ByVal J_COM_ID As String _
                                    , ByVal J_D_A_ID As String _
                                    , ByVal J_DT_ID As String _
                                    , ByVal J_DI_ID As String _
                                    , ByVal J_DP_ID As String _
                                    , ByVal J_Engineer_ID As String _
                                    , ByVal J_Date_Closed As Date _
                                    , ByVal J_Shift As String _
                                    , ByVal J_SMU As String _
                                    , ByVal J_Instruction As String _
                                    , ByVal J_Status As String _
                                    , ByVal J_Notes As String _
                                    , ByVal J_Modified_By As String)

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
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
                cmd.Parameters("@J_COG_ID").Value = J_COG_ID
                cmd.Parameters("@J_Handler").Value = J_Handler
                cmd.Parameters("@J_COM_ID").Value = J_COM_ID
                cmd.Parameters("@J_D_A_ID").Value = J_D_A_ID
                cmd.Parameters("@J_DT_ID").Value = J_DT_ID
                cmd.Parameters("@J_DI_ID").Value = J_DI_ID
                cmd.Parameters("@J_DP_ID").Value = J_DP_ID
                cmd.Parameters("@J_Engineer_ID").Value = J_Engineer_ID
                cmd.Parameters("@J_Date_Closed").Value = J_Date_Closed
                cmd.Parameters("@J_Shift").Value = J_Shift
                cmd.Parameters("@J_SMU").Value = J_SMU
                cmd.Parameters("@J_Instruction").Value = J_Instruction
                cmd.Parameters("@J_Status").Value = J_Status
                cmd.Parameters("@J_Notes").Value = J_Notes
                cmd.Parameters("@J_Modified_By").Value = J_Modified_By

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

        Public Function DATA_INPUT_RG_SMU_SP(ByVal SiteId As String, ByVal SMUDate As Date, ByVal SMU_Id As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RG_SMU_SP")

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@SMUDate").Value = Format$(SMUDate, "dd MMM yyyy")
                cmd.Parameters("@SMU_Id").Value = SMU_Id


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_RG_SMU_CHECKER_SP(ByVal SiteId As String, ByVal SMUDate As Date, ByVal SMU_Id As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RG_SMU_CHECKER_SP")

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@SMUDate").Value = Format$(SMUDate, "dd MMM yyyy")
                cmd.Parameters("@SMU_Id").Value = SMU_Id


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_RG_FUEL_SP(ByVal SiteId As String, ByVal FuelDate As Date, ByVal SMU_Id As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RG_FUEL_SP")

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@FuelDate").Value = Format$(FuelDate, "dd MMM yyyy")
                cmd.Parameters("@SMU_Id").Value = SMU_Id


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_RG_ACTIVITY_SP(ByVal SiteId As String, ByVal ActivityDate As Date, ByVal Activity_Id As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_RG_ACTIVITY_SP")

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@ACtivityDate").Value = Format$(ActivityDate, "dd MMM yyyy")
                cmd.Parameters("@Activity_Id").Value = Activity_Id


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_RG_BrakeTest_SP(ByVal SiteId As String, ByVal BRKDate As Date, ByVal BRK_Id As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
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

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@BRKDate").Value = Format$(BRKDate, "dd MMM yyyy")
                cmd.Parameters("@BRK_Id").Value = BRK_Id


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_CB_FUELDATE_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_FUELDATE_SP")

                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_ACTIVITYDATE_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_ACTIVITYDATE_SP")

                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_OPERATOR_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_OPERATOR_SP")

                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function DATA_INPUT_CB_TASKCODES_SP() As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_TASKCODES_SP")


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function


        Public Function DATA_INPUT_CB_BRAKETESTDATE_SP(ByVal SiteId As Integer) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("DATA_INPUT_CB_BRAKETESTDATE_SP")

                cmd.Parameters("@SiteId").Value = SiteId


                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return datatable to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function TASK_BRAKETEST_SHEET(ByVal SiteId As Integer, ByVal BrakeTestDate As Date, ByVal BRK_CheckedBy As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetCommand("TASK_BRAKETEST_SHEET")

                cmd.Parameters("@SiteId").Value = SiteId
                cmd.Parameters("@BrakeTestDate").Value = Format$(BrakeTestDate, "dd MMM yyyy")
                cmd.Parameters("@BRK_CheckedBy").Value = BRK_CheckedBy


                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Function SqlDS_Get_Session(ByVal Session_GUID As String) As DataTable
            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetTextCommand("SELECT This_ID, Session_GUID, Session_Username, Session_APP, Session_SiteID, Session_SiteName, Session_BusArea, Session_Sub_APP, Session_Value2, Session_Permission, Session_IP FROM SESSION_TRACKER WHERE (Session_GUID = @Session_GUID) AND (Session_APP = 100)")

                cmd.Parameters.AddWithValue("@Session_GUID", Session_GUID)

                Dim ds As DataSet
                ds = dbConnection.RetrieveDataset(cmd)

                'Return dataset to caller
                Return ds.Tables(0)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Function

        Public Sub FLEET_OVERNIGHT_SERVICING()

            '-----------------------------------------------------------------------------
            'Description: 
            '
            'Revision History
            '------------------
            '
            'Who  Date         Comment
            '---  -----------  -----------------------------------------------------------
            'DAW  01/02/2016   Initial Version
            '
            '-----------------------------------------------------------------------------
            Try
                'Set up connection to database based on Connection String
                Dim dbConnection As BanksDataAccess.IDataAccess

                dbConnection = BanksDataAccess.DatabaseImplementor.GetInstance.GetDatabaseConnection(BanksDataAccess.DatabaseImplementor.DataSource.SQL)

                dbConnection.ConnectionString = mConnectionString

                'Create a command to fire at database
                Dim cmd As Data.SqlClient.SqlCommand

                cmd = dbConnection.GetTextCommand("EXEC msdb.dbo.sp_start_job N'FLEET_OVERNIGHT_SERVICING'")

                dbConnection.ExecuteNonQuery(cmd)

            Catch ex As Exception
                Throw 'New System.Exception(ex.Message)

            End Try
        End Sub

#End Region

    End Class

End Namespace
