<%@ Page Language="VB" AutoEventWireup="false" Title="CAMS Home" CodeFile="flt_MAIN_HOME.aspx.vb" Inherits="CLIENT_flt_MAIN_HOME" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <%-- <meta http-equiv="refresh" content="30" />--%>
    <title></title>
    <link rel="shortcut icon" href="../IMAGES/fleet_16.ico" />
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style5 {
            height: 45px;
            width: 886px;
        }

        .style6 {
            height: 45px;
            color: black;
            font-size: medium;
        }

        .style11 {
            height: 45px;
            width: 791px;
        }

        .style14 {
            width: 134px;
        }

        .style15 {
            width: 220px;
        }

        .style18 {
            width: 160px;
        }

        .auto-style3 {
            width: 202px;
        }
        
                .showitem {
            display: block;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
        }

        .hideitem {
            display: none;
        }

        panel#HOME_Panel {
            display: none;
        }

        panel#ANALYSIS_HOME_1 {
            display: none;
        }

        panel#ANALYSIS_HOME_2 {
            display: none;
        }

        panel#ANALYSIS_HOME_3 {
            display: none;
        }

        panel#ANALYSIS_HOME_4 {
            display: none;
        }

         panel#ANALYSIS_HOME_5 {
            display: none;
        }

          panel#ANALYSIS_HOME_6 {
            display: none;
        }

           panel#ANALYSIS_HOME_7 {
            display: none;
        }

            panel#ANALYSIS_HOME_8 {
            display: none;
        }
             panel#ANALYSIS_HOME_9 {
            display: none;
        }
              panel#ANALYSIS_HOME_10 {
            display: none;
        }
                 panel#ANALYSIS_HOME_11 {
            display: none;
        }
                 panel#ANALYSIS_HOME_12 {
            display: none;
        }
                 panel#ANALYSIS_HOME_13 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_1 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_2 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_3 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_4 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_5 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_6 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_7 {
            display: none;
        }

        panel#CONDITION_MONITORING_HOME_8 {
            display: none;
        }

        panel#DATA_INPUT_HOME_1 {
            display: none;
        }

        panel#DATA_INPUT_HOME_2 {
            display: none;
        }

        panel#DATA_INPUT_HOME_3 {
            display: none;
        }
         panel#DATA_INPUT_HOME_4 {
            display: none;
        }
          panel#DATA_INPUT_HOME_5 {
            display: none;
        }
           panel#DATA_INPUT_HOME_6 {
            display: none;
        }
            panel#DATA_INPUT_HOME_7 {
            display: none;
        }
             panel#DATA_INPUT_HOME_8 {
            display: none;
        }

        panel#REPORT_HOME_1 {
            display: none;
        }

        panel#REPORT_HOME_2 {
            display: none;
        }

        panel#REPORT_HOME_3 {
            display: none;
        }

        panel#ASSET_MANAGEMENT_HOME_1 {
            display: none;
        }

        panel#ASSET_MANAGEMENT_HOME_2 {
            display: none;
        }

        panel#ASSET_MANAGEMENT_HOME_3 {
            display: none;
        }

          panel#ASSET_MANAGEMENT_HOME_4 {
            display: none;
        }
            panel#ASSET_MANAGEMENT_HOME_5 {
            display: none;
        }
             panel#ASSET_MANAGEMENT_HOME_6 {
            display: none;
        }
              panel#CUSTOMER_MANAGEMENT_HOME_1 {
            display: none;
        }

        panel#CUSTOMER_MANAGEMENT_HOME_2 {
            display: none;
        }

        panel#CUSTOMER_MANAGEMENT_HOME_3 {
            display: none;
        }

          panel#CUSTOMER_MANAGEMENT_HOME_4 {
            display: none;
        }
            panel#CUSTOMER_MANAGEMENT_HOME_5 {
            display: none;
        }


        panel#COMPONENT_MANAGEMENT_HOME_1 {
            display: none;
        }

        panel#COMPONENT_MANAGEMENT_HOME_2 {
            display: none;
        }

        panel#COMPONENT_MANAGEMENT_HOME_3 {
            display: none;
        }

        panel#COMPONENT_MANAGEMENT_HOME_4 {
            display: none;
        }

         panel#COMPONENT_MANAGEMENT_HOME_5 {
            display: none;
        }

        panel#EVENT_MANAGEMENT_HOME_1 {
            display: none;
        }

        panel#EVENT_MANAGEMENT_HOME_2 {
            display: none;
        }

        panel#EVENT_MANAGEMENT_HOME_3 {
            display: none;
        }

        panel#EVENT_MANAGEMENT_HOME_4 {
            display: none;
        }

        panel#EVENT_MANAGEMENT_HOME_5 {
            display: none;
        }

         panel#EVENT_MANAGEMENT_HOME_6 {
            display: none;
        }

        panel#ADMIN_HOME_1 {
            display: none;
        }

        panel#ADMIN_HOME_2 {
            display: none;
        }

        panel#ADMIN_HOME_3 {
            display: none;
        }

        panel#ADMIN_HOME_4 {
            display: none;
        }

        panel#ADMIN_HOME_5 {
            display: none;
        }

        panel#ADMIN_HOME_6 {
            display: none;
        }

        panel#ADMIN_HOME_7 {
            display: none;
        }

        panel#ADMIN_HOME_8 {
            display: none;
        }

        panel#ADMIN_HOME_9 {
            display: none;
        }
        .auto-style5 {
            width: 1004px;
        }
        .auto-style6 {
            width: 991px;
        }
        </style>
    <link href="../STYLES/CAMS.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
       function gebi(id) {
        return document.getElementById(id);
    }
    function fn_home() {
        gebi('<%= btn_home.ClientID %>').click();
    }
    function fn_analysis() {
        gebi('<%= btn_analysis.ClientID %>').click();
    }
    function fn_analysis_home_1() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_CHART.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_2() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_ENGINEER_REPORT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_3() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_MAGNETIC_PLUG_INSPECTIONS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_4() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_BRAKE_TESTING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_5() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_PrimeMoverReport.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_6() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_WASH_CHART.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_7() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_PRODUCTION.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_8() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_ASSET_COSTING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_9() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_CARBON.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_10() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_HOSES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_11() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_TYRES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_12() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_STATISTICS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_analysis_home_13() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_CUSTOMERS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_condition_monitoring() {
        gebi('<%= btn_condition_monitoring.ClientID %>').click();
    }
    function fn_condition_monitoring_home_1() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://www.lubetrend.com/Account/Login?ReturnUrl=%2f', '_blank');
    }
    function fn_condition_monitoring_home_2() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://tmsweb.bridgestone.eu/Login/Login.aspx?ReturnUrl=%2fdefault.aspx', '_blank');
    }
    function fn_condition_monitoring_home_3() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://banksnet.hjbanks.com/otcs/cs.exe?func=ll&objId=9869723&objAction=browse&viewType=1', '_blank');
    }
    function fn_condition_monitoring_home_4() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://banksnet.hjbanks.com/otcs/cs.exe?func=ll&objId=9870266&objAction=browse&viewType=1', '_blank');
    }
    function fn_condition_monitoring_home_5() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://identity.trimble.com/i/authenticationendpoint/login.do?client_id=3YcLC7Eg_zFjT2VfTm5UXFjL5lka&commonAuthCallerPath=%2Foauth2%2Fauthorize&forceAuth=false&passiveAuth=false&redirect_uri=https%3A%2F%2Flegacy.myvisionlink.com%2FVisionlink.aspx&relyingParty=3YcLC7Eg_zFjT2VfTm5UXFjL5lka&response_type=code&scope=openid&tenantId=1&type=oidc&sessionDataKey=df23d445-952e-43fb-8c30-e2aa86d31c57&relyingParty=3YcLC7Eg_zFjT2VfTm5UXFjL5lka&type=oidc&sp=VisionLink-Legacy&isSaaSApp=true&authenticators=SAMLSSOAuthenticator:Kiewit;DomainAwareSubjectAuthenticator:Caterpillar;ExtendedBasicAuthenticator:LOCAL', '_blank');
    }
    function fn_condition_monitoring_home_6() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://ww-komtrax.komatsu.co.jp/keisa/ww/Login.aspx', '_blank');
    }
    function fn_condition_monitoring_home_7() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://www.caretrackvolvo.com/caretrack/', '_blank');
    }
    function fn_condition_monitoring_home_8() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('https://www.jcbll.com/Live/JCBLiveLink/PreTenancy/Authentication/Login', '_blank');
    }
    function fn_event_dashboard() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input() {
        gebi('<%= btn_data_input.ClientID %>').click();
    }
    function fn_data_input_home_1() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/BRAKE/flt_BRAKETEST_INPUT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_2() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/flt_MAGNETIC_PLUG_INSPECTIONS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_3() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/FUEL/flt_FUEL_INPUT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_4() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/SMU/flt_SMU_INPUT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_5() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/flt_WASH_PLANT_TIMESHEETS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_6() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/flt_PRODUCTION.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_7() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/flt_HOSES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_data_input_home_8() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DATA_INPUT/flt_WASH_PLANT_GRAVITY.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_report() {
        gebi('<%= btn_reports.ClientID %>').click();
       }
       function fn_report_home_1() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../REPORTS/flt_REPORT_DATAINPUT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_report_home_2() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../REPORTS/flt_REPORT_ASSET.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_report_home_3() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../REPORTS/flt_REPORT_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_asset_management() {
           gebi('<%= btn_asset_management.ClientID %>').click();
    }
    function fn_asset_management_home_1() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../DASHBOARDS/flt_D_ASSET.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_asset_management_home_2() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ASSET_MANAGEMENT/flt_AM_ASSET_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_asset_management_home_3() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ASSET_MANAGEMENT/flt_AM_ASSET_MOVEMENTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_asset_management_home_4() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ASSET_MANAGEMENT/flt_AM_ASSET_LEASING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_asset_management_home_5() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ASSET_MANAGEMENT/flt_AM_ASSET_SERVICE_CONTRACTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_asset_management_home_6() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ASSET_MANAGEMENT/flt_AM_ENGINE_LOAD_FACTORS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_component_management() {
        gebi('<%= btn_component_management.ClientID %>').click();
       }
       function fn_component_management_home_1() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../DASHBOARDS/flt_D_PLANNING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_component_management_home_2() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../ASSET_MANAGEMENT/flt_AM_PART_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_component_management_home_3() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../ASSET_MANAGEMENT/flt_AM_PART_INSPECTIONS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_component_management_home_4() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../DASHBOARDS/flt_D_WARRANTY.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_component_management_home_5() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../ASSET_MANAGEMENT/flt_AM_LUBRICANTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
    function fn_customer_management() {
        gebi('<%= btn_customer_management.ClientID %>').click();
    }
    function fn_customer_management_home_1() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../CUSTOMER_MANAGEMENT/flt_CUSTOMER_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_customer_management_home_2() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../CUSTOMER_MANAGEMENT/flt_CONTACT_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_customer_management_home_3() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../CUSTOMER_MANAGEMENT/flt_SITE_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_customer_management_home_4() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../CUSTOMER_MANAGEMENT/flt_CUSTOMER_SATISFACTION_SURVEY_LIST.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }
    function fn_customer_management_home_5() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../CUSTOMER_MANAGEMENT/flt_CUSTOMER_PREFERENCES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
    }

       function fn_event_management() {
           gebi('<%= btn_event_management.ClientID %>').click();
       }
       function fn_event_management_home_1() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../EVENT_MANAGEMENT/flt_EM_ACTIVE_EVENTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
       }
       function fn_event_management_home_2() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../EVENT_MANAGEMENT/flt_EM_JOBS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
       }
       function fn_event_management_home_3() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../EVENT_MANAGEMENT/flt_EM_FITTERS_TIMESHEETS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
       }
       function fn_event_management_home_4() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../DASHBOARDS/flt_D_EVENT_CAL.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_event_management_home_5() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../EVENT_MANAGEMENT/flt_EM_ARCHIVE_EVENTS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
       }
       function fn_event_management_home_6() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../EVENT_MANAGEMENT/flt_EM_EVENT_PLUS_VIEW.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }

       function fn_servicing() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../DASHBOARDS/flt_D_SERVICING.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_plant_activity() {
          var THISGUID = gebi('HF_GUID').value;
           window.open('../DATA_INPUT/ACTIVITY/flt_ACTIVITY_INPUT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=1', '_self');
       }
       function fn_administration() {
           gebi('<%= btn_system_administration.ClientID %>').click();
    }
    function fn_admin_home_1() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_ASSET.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_2() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_EVENT.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_3() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_SMU.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_4() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_EMPLOYEES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_5() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_OTHER.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_6() {
       var THISGUID = gebi('HF_GUID').value;
        var SESSION_ID = gebi('HF_Session_ID').value;
        var CLIENT_APP_ID = gebi('HF_Client_APP_ID').value;
        window.open('http://hoaspsvr1/ICT_CENTRAL/PERMISSIONS/perm_set.aspx?SESSION_ID=' + SESSION_ID + '&CLIENT_APP_ID=' + CLIENT_APP_ID);
    }
    function fn_admin_home_7() {
        var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_TRIGGERS.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=3', '_self');
    }
    function fn_admin_home_8() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_AUDIT_HOME.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    function fn_admin_home_9() {
       var THISGUID = gebi('HF_GUID').value;
        window.open('../ADMIN/flt_ADMIN_MODULES.aspx?FLT_GUID=' + THISGUID + '&PreviousPage=2', '_self');
    }
    ////////////////BUTTONS\\\\\\\\\\\\\\\\\\\\\\\\\
    //function fn_1() {
    //    var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_2() {
    //   var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_3() {
    //   var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1200, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_4() {
    //   var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    //function fn_5() {
    //   var THISGUID = document.getElementById('HF_GUID').value;
    //    var S_Height = (screen.height * 0.8);
    //    var S_Top = (screen.height * 0.05);
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
    function fn_6() {
       var THISGUID = document.getElementById('HF_GUID').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    }
    function fn_7() {
       var THISGUID = document.getElementById('HF_GUID').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    }
    function fn_8() {
       var THISGUID = document.getElementById('HF_GUID').value;
        var S_Height = (screen.height * 0.8);
        var S_Top = (screen.height * 0.05);
        window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    }
    //function fn_9() {
    //   var THISGUID = gebi('HF_GUID').value;
    //    window.open('../VIEWS/HOME/view_HOME_AVERAGE_BREAKDOWN_LENGTH.aspx?FLT_GUID=' + THISGUID, '_blank', 'height= ' + S_Height + ', width=1000, top= ' + S_Top + ', status=no, menubar = yes, resizable = yes,location=no, scrollbars=yes');
    //}
</script>
<body>
    <form id="form1" runat="server">
        <div style="font-family: 'Arial Rounded MT Bold'; font-size: 18px; text-align: left; height: 100%;">
                    <table class="style1" cellspacing="0">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; font-weight: bold; padding-left: 15px; background-color: #ff661c; text-align: left;" class="auto-style3">
                                &nbsp;&nbsp;
                            <img alt="" src="../IMAGES/HOME_58.png" id="Img2" onclick="fn_home()" style="cursor: pointer" />
                                
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; background-color: #ff661c; text-align: right; padding-right: 100px;" class="auto-style5">
                                <asp:Label ID="lblSysName" runat="server" Font-Size="48px" Text="CAMS" Font-Names="Segoe UI"></asp:Label>
                                &nbsp;<asp:Label ID="lblVersion" runat="server" Font-Size="8pt"  Text="v0.0"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 28px; font-weight: bold; background-color: #ff661c; text-align: left; padding-left: 100px;" class="auto-style5">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/IMAGES/BPS/LOGO BPS WHITE ON TRANSPARENT.gif" Height="50px" Width="220px" />
                            </td>
                            <td align="center" style="color: White; font-family: 'Segoe UI'; font-size: 14px; font-weight: bold; padding-right: 15px; background-color: #ff661c; text-align: right;" valign="middle">
                                 <asp:Panel ID="ADMINISTRATION_Panel_1" runat="server" onClick="fn_administration()" BackColor="#ff661c">
                                     <br />
                                <img alt="" src="../IMAGES/metro_setting_58x58.png" id="Img_Admin" style="cursor: pointer" />
                                    &nbsp; 
                                 </asp:Panel>
                            </td>
                        </tr>
                    </table>
            <table class="style1" cellspacing="0" style="line-height: 50px">
                        <tr>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 20px; padding-left: 15px; background-color: #747474; text-align: center; font-weight: bold;" class="auto-style3">
                                 <asp:Label ID="lblTitle" runat="server" Text="" Font-Bold="False" ForeColor="White"></asp:Label>
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: right;" class="auto-style6">
                            </td>
                            <td align="left" style="color: White; font-family: 'Segoe UI'; font-size: 16px; padding-left: 15px; background-color: #747474; text-align: left;">
                            </td>
                        </tr>
                    </table>
                    <table width="100%" cellspacing="0">
                                       <tr>
                    <td valign="top" style="padding-left: 15px; padding-right: 5px">
                        <table width="99%" cellspacing="0" style="padding-top: 20px">
                            <tr>
                                <td height="100%" width="9%">
                                    &nbsp;</td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table101" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0" >
                                        <asp:TableRow ID="TableRow1" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_1" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                          <%--  <asp:Label ID="lblCount_1Hrs" runat="server" Text="hrs" Font-Size="14pt" ForeColor="Black"></asp:Label>--%>
                                                            <asp:ImageButton ID="img_Arrow_1" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label1" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow2" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_1_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_1_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                    <%--<asp:Table ID="Table109" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0" Visible="False">
                                        <asp:TableRow ID="TableRow48" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_9_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_9" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_9" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label66" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </asp:TableCell>
                                            </asp:TableRow>
                                        <asp:TableRow ID="TableRow49" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_9_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_9_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table102" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow38" runat="server">
                                            <asp:TableCell runat="server" ID="ID_2_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_2" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_2" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label2" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                          </asp:TableRow>
                                        <asp:TableRow ID="TableRow3" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_2_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_2_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table103" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow39" runat="server">
                                            <asp:TableCell runat="server" ID="ID_3_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_3" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                           <%-- <asp:Label ID="Label61" runat="server" Text="days" Font-Size="14pt" ForeColor="Black"></asp:Label>--%>
                                                            <asp:ImageButton ID="img_Arrow_3" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label3" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                             </asp:TableRow>
                                        <asp:TableRow ID="TableRow4" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_3_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                             <asp:ImageButton ID="img_3_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table104" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow40" runat="server">
                                            <asp:TableCell runat="server" ID="ID_4_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_4" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                             <asp:ImageButton ID="img_Arrow_4" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label4" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow5" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_4_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_4_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" width="9%">
                                    <asp:Table ID="Table105" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow41" runat="server">
                                            <asp:TableCell runat="server" ID="ID_5_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_5" runat="server" Text="0" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_5" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label5" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow6" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_5_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_5_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                                <td height="100%" width="9%">
                                   <%-- <asp:Table ID="Table106" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow42" runat="server">
                                            <asp:TableCell runat="server" ID="ID_6_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_6" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_6" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label38" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow7" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_6_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_6_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                   <%-- <asp:Table ID="Table107" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow43" runat="server">
                                            <asp:TableCell runat="server" ID="ID_7_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_7" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_7" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr style="text-align: center">
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label39" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow8" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_7_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_7_B" runat="server"  Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%">
                                  <%--  <asp:Table ID="Table108" runat="server" Height="150px" Style="cursor: pointer" Width="120px" CellSpacing="0">
                                        <asp:TableRow ID="TableRow44" runat="server">
                                            <asp:TableCell runat="server" ID="ID_8_A" BackColor="#747474" CssClass="roundcornerstop">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="text-align: center; padding-top: 15px;">
                                                            <asp:Label ID="lblCount_8" runat="server" Text="0" Font-Size="28pt" ForeColor="White" ToolTip="tbc"></asp:Label>
                                                            <asp:ImageButton ID="img_Arrow_8" runat="server" ImageUrl="~/IMAGES/ARROW_DOWN_32_INV.png" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="metro_150x100_cell_content_bottom">
                                                            <asp:Label ID="Label40" runat="server" ForeColor="White" Font-Size="10"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                              </asp:TableRow>
                                        <asp:TableRow ID="TableRow9" runat="server" >
                                            <asp:TableCell runat="server" ID="ID_8_B" BackColor="#747474" CssClass="roundcornersbottom">
                                                <table border="0" style="font-family: 'Microsoft Sans Serif'">
                                                    <tr>
                                                        <td style="padding-left: 45px;" >
                                                            <asp:ImageButton ID="img_8_B" runat="server" Enabled="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>--%>
                                </td>
                                <td height="100%" width="9%" align="right">
                                    &nbsp;</td>
                            </tr>
                            </table>
                        <table width="100%" cellspacing="0">
                            <tr >
                                <td height="100%" style="padding-left: 15px">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" colspan="2">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" colspan="7">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px">
                                    &nbsp;</td>
                            </tr>
                            <tr bgcolor="#747474">
                                <td height="50px" style="padding-left: 15px">
                                    &nbsp;</td>
                                <td height="50px" style="padding-left: 15px" colspan="2">
                                   
                                </td>
                                <td height="50px" style="padding-left: 15px" colspan="7">
                                    
                                </td>
                                <td height="50px" style="padding-left: 15px">
                                    &nbsp;</td>
                            </tr>
                             <tr >
                                <td height="100%" style="padding-left: 15px">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" colspan="2">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" colspan="7">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 1px" valign="top">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 1px" colspan="3" valign="top">
                        <asp:Table ID="T1" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow34" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_1" CssClass="roundcorners">
                                    <asp:Panel ID="ANALYSIS_Panel_1" runat="server" onClick="fn_analysis()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label34" runat="server" Text="ANALYSIS & STATISTICS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                   <%-- <asp:Panel ID="HOME_Panel" runat="server" onClick="fn_home()" BackColor="Gray">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/home_58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label8" runat="server" Text="HOME" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>--%>
                                     <asp:Panel ID="ANALYSIS_HOME_1" runat="server" onClick="fn_analysis_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label10" runat="server" Text="PLANT ANALYSIS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_13" runat="server" onClick="fn_analysis_home_13()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/CUSTOMER_MANAGEMENT_GLOBE.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label83" runat="server" Text="CUSTOMERS (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CONDITION_MONITORING_HOME_1" runat="server" onClick="fn_condition_monitoring_home_1()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_OIL_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label20" runat="server" Text="OIL SAMPLING (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="DATA_INPUT_HOME_1" runat="server" onClick="fn_data_input_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_BRAKE2.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label25" runat="server" Text="BRAKE TEST" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="REPORT_HOME_1" runat="server" onClick="fn_report_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label26" runat="server" Text="DATA INPUT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ASSET_MANAGEMENT_HOME_1" runat="server" onClick="fn_asset_management_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD_ASSET_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label42" runat="server" Text="ASSET DASHBOARD" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="COMPONENT_MANAGEMENT_HOME_1" runat="server" onClick="fn_component_management_home_1()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD_PLANNING.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label44" runat="server" Text="COMPONENT CHANGEOUT PLANNER (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CUSTOMER_MANAGEMENT_HOME_1" runat="server" onClick="fn_customer_management_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/CUSTOMER_MANAGEMENT_GLOBE.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label66" runat="server" Text="CUSTOMER LIST" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="EVENT_MANAGEMENT_HOME_1" runat="server" onClick="fn_event_management_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_DETAIL.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label46" runat="server" Text="EVENT DETAIL" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_1" runat="server" onClick="fn_admin_home_1()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label51" runat="server" Text="ASSET & PART TABLES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T6" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow29" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_6" CssClass="roundcorners">
                                     <asp:Panel ID="ASSET_MANAGEMENT_Panel_1" runat="server" onClick="fn_asset_management()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/BPS/Black/BPS_ICON_asset_management_black.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label30" runat="server" Text="ASSET MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_2" runat="server" onClick="fn_analysis_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label14" runat="server" Text="ENGINEERS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CONDITION_MONITORING_HOME_2" runat="server" onClick="fn_condition_monitoring_home_2()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_TYRE_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label21" runat="server" Text="TYRES (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="DATA_INPUT_HOME_2" runat="server" onClick="fn_data_input_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label6" runat="server" Text="MAGNETIC PLUGS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="REPORT_HOME_2" runat="server" onClick="fn_report_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_MANAGEMENT_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label27" runat="server" Text="ASSET MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ASSET_MANAGEMENT_HOME_2" runat="server" onClick="fn_asset_management_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_LIST_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label43" runat="server" Text="ASSET LIST" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="COMPONENT_MANAGEMENT_HOME_2" runat="server" onClick="fn_component_management_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label45" runat="server" Text="COMPONENT PARTS TRACKER" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CUSTOMER_MANAGEMENT_HOME_2" runat="server" onClick="fn_customer_management_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/CUSTOMER_CONTACT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label80" runat="server" Text="CONTACTS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="EVENT_MANAGEMENT_HOME_2" runat="server" onClick="fn_event_management_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_JOB_MANAGEMENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label47" runat="server" Text="JOB MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_2" runat="server" onClick="fn_admin_home_2()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label52" runat="server" Text="EVENT / JOB TABLES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T2" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow45" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_2" CssClass="roundcorners">
                                    <asp:Panel ID="CONDITION_MONITORING_Panel_1" runat="server" onClick="fn_condition_monitoring()" CssClass="roundcorners" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/BPS/Black/BPS_ICON_condition_monitoring_black.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label41" runat="server" Text="CONDITION MONITORING (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_3" runat="server" onClick="fn_analysis_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label63" runat="server" Text="MAGNETIC PLUGS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CONDITION_MONITORING_HOME_3" runat="server" onClick="fn_condition_monitoring_home_3()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_THOROUGH_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label22" runat="server" Text="THOROUGH EXAMINATIONS (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="DATA_INPUT_HOME_3" runat="server" onClick="fn_data_input_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_FUEL.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label19" runat="server" Text="FUEL" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    
                                    <asp:Panel ID="REPORT_HOME_3" runat="server" onClick="fn_report_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_MANAGEMENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label37" runat="server" Text="EVENT MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ASSET_MANAGEMENT_HOME_3" runat="server" onClick="fn_asset_management_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_MOVEMENT_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label62" runat="server" Text="ASSET MOVEMENTS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="COMPONENT_MANAGEMENT_HOME_3" runat="server" onClick="fn_component_management_home_3()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_PARTS.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label60" runat="server" Text="COMPONENT PARTS INSPECTIONS (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CUSTOMER_MANAGEMENT_HOME_3" runat="server" onClick="fn_customer_management_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/SITE_LOCATION.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label81" runat="server" Text="SITES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="EVENT_MANAGEMENT_HOME_3" runat="server" onClick="fn_event_management_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_FITTER_TIMESHEET.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label48" runat="server" Text="TIMESHEETS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_3" runat="server" onClick="fn_admin_home_3()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label53" runat="server" Text="CODE TABLES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T7" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow36" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_7" CssClass="roundcorners">
                                    <asp:Panel ID="COMPONENT_MANAGEMENT_Panel_1" runat="server" onClick="fn_component_management()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label36" runat="server" Text="COMPONENT MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_4" runat="server" onClick="fn_analysis_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label59" runat="server" Text="BRAKE TESTING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CONDITION_MONITORING_HOME_4" runat="server" onClick="fn_condition_monitoring_home_4()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_TRACK_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label23" runat="server" Text="TRACK INSPECTIONS (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="DATA_INPUT_HOME_4" runat="server" onClick="fn_data_input_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_SMU.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label24" runat="server" Text="SMU" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    
                                     <asp:Panel ID="ASSET_MANAGEMENT_HOME_4" runat="server" onClick="fn_asset_management_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label72" runat="server" Text="ASSET LEASING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="COMPONENT_MANAGEMENT_HOME_4" runat="server" onClick="fn_component_management_home_4()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label13" runat="server" Text="WARRANTY TRACKER (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CUSTOMER_MANAGEMENT_HOME_4" runat="server" onClick="fn_customer_management_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label84" runat="server" Text="SATISFACTION SURVEYS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="EVENT_MANAGEMENT_HOME_4" runat="server" onClick="fn_event_management_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD_EVENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label49" runat="server" Text="EVENT PLANNING CALENDAR" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_4" runat="server" onClick="fn_admin_home_4()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label54" runat="server" Text="EMPLOYEES TABLES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                   
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 1px" valign="top">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 1px" colspan="3" valign="top">
                        <asp:Table ID="T3" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow27" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_3" CssClass="roundcorners">
                                    <asp:Panel ID="EVENT_DASHBOARD_Panel_1" runat="server" onClick="fn_event_dashboard()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD_EVENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label28" runat="server" Text="EVENT DASHBOARD" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ANALYSIS_HOME_5" runat="server" onClick="fn_analysis_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label12" runat="server" Text="PRIME MOVERS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CONDITION_MONITORING_HOME_5" runat="server" onClick="fn_condition_monitoring_home_5()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_CATERPILLAR_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label15" runat="server" Text="CAT VISIONLINK (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="DATA_INPUT_HOME_5" runat="server" onClick="fn_data_input_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_TIMESHEET.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label9" runat="server" Text="PROCESSING PLANT TIMESHEETS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ASSET_MANAGEMENT_HOME_5" runat="server" onClick="fn_asset_management_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ASSET_SERVICE_CONTRACTS_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label73" runat="server" Text="ASSET SERVICE CONTRACTS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      <asp:Panel ID="COMPONENT_MANAGEMENT_HOME_5" runat="server" onClick="fn_component_management_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label76" runat="server" Text="LUBRICANTS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CUSTOMER_MANAGEMENT_HOME_5" runat="server" onClick="fn_customer_management_home_5()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/security.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label82" runat="server" Text="PREFERENCES (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="EVENT_MANAGEMENT_HOME_5" runat="server" onClick="fn_event_management_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_ARCHIVE.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label50" runat="server" Text="EVENT ARCHIVE" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      <asp:Panel ID="ADMIN_HOME_5" runat="server" onClick="fn_admin_home_5()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label56" runat="server" Text="ALL OTHER TABLES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T8" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow32" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_8" CssClass="roundcorners">
                                    <asp:Panel ID="EVENT_MANAGEMENT_Panel_1" runat="server" onClick="fn_event_management()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/EVENT_MANAGEMENT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label33" runat="server" Text="EVENT MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      <asp:Panel ID="ANALYSIS_HOME_6" runat="server" onClick="fn_analysis_home_6()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label7" runat="server" Text="PROCESSING PLANT ANALYSIS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CONDITION_MONITORING_HOME_6" runat="server" onClick="fn_condition_monitoring_home_6()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_KOMATSU_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label16" runat="server" Text="KOMATSU KOMTRAX (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="DATA_INPUT_HOME_6" runat="server" onClick="fn_data_input_home_6()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label68" runat="server" Text="PRODUCTION" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      <asp:Panel ID="ASSET_MANAGEMENT_HOME_6" runat="server" onClick="fn_asset_management_home_6()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/ENGINE_LOAD_FACTOR_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label74" runat="server" Text="ENGINE LOAD FACTORS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="EVENT_MANAGEMENT_HOME_6" runat="server" onClick="fn_event_management_home_6()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label8" runat="server" Text="EVENT PLUS 250" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                  <asp:Panel ID="ADMIN_HOME_6" runat="server" onClick="fn_admin_home_6()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/security.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label57" runat="server" Text="PERMISSIONS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                   
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T4" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow28" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_4" CssClass="roundcorners">
                                     <asp:Panel ID="ANALYSIS_HOME_7" runat="server" onClick="fn_analysis_home_7()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label11" runat="server" Text="PRODUCTION ANALYSIS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="CUSTOMER_MANAGEMENT_Panel_1" runat="server" onClick="fn_customer_management()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/CUSTOMER_MANAGEMENT_GLOBE.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label61" runat="server" Text="CUSTOMER MANAGEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    
                                     <asp:Panel ID="CONDITION_MONITORING_HOME_7" runat="server" onClick="fn_condition_monitoring_home_7()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_VOLVO_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label17" runat="server" Text="VOLVO CARETRACK (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="DATA_INPUT_HOME_7" runat="server" onClick="fn_data_input_home_7()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/metro_document_edit_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label77" runat="server" Text="HOSES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ADMIN_HOME_7" runat="server" onClick="fn_admin_home_7()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label55" runat="server" Text="JOB TRIGGERS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T9" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow30" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_9" CssClass="roundcorners">
                                    <asp:Panel ID="DATA_INPUT_Panel_1" runat="server" onClick="fn_data_input()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label29" runat="server" Text="DATA INPUT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="SERVICING_Panel_1" runat="server" onClick="fn_servicing()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/BPS/Black/BPS_ICON_servicing_and_repairs_black.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label31" runat="server" Text="SERVICING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_8" runat="server" onClick="fn_analysis_home_8()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label69" runat="server" Text="ASSET COSTING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="CONDITION_MONITORING_HOME_8" runat="server" onClick="fn_condition_monitoring_home_8()" BackColor="Red">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/EARTH_JCB_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label18" runat="server" Text="JCB LIVELINK (TBC)" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      <asp:Panel ID="DATA_INPUT_HOME_8" runat="server" onClick="fn_data_input_home_8()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_TIMESHEET.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label79" runat="server" Text="WASH PLANT SPECIFIC GRAVITY" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_8" runat="server" onClick="fn_admin_home_8()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label58" runat="server" Text="AUDITING" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td height="100%" style="padding-left: 1px" valign="top">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 1px" colspan="3" valign="top">
                        <asp:Table ID="T5" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow31" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_5" CssClass="roundcorners">
                                    <asp:Panel ID="REPORT_Panel_1" runat="server" onClick="fn_report()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_scales_58x58.PNG" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label32" runat="server" Text="REPORTS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_9" runat="server" onClick="fn_analysis_home_9()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label70" runat="server" Text="PLANT RESOURCE EFFICIENCY" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="ADMIN_HOME_9" runat="server" onClick="fn_admin_home_9()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img alt="" src="../IMAGES/Icons_Black/metro_setting_58x58.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label67" runat="server" Text="SYSTEM STATUS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                        <asp:Table ID="T10" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow35" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_10" CssClass="roundcorners">
                                    <asp:Panel ID="PLANT_ACTIVITY_Panel_1" runat="server" onClick="fn_plant_activity()" CssClass="roundcorners" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DATA_INPUT_TIMESHEET.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label35" runat="server" Text="PLANT ACTIVITY" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                     <asp:Panel ID="ANALYSIS_HOME_10" runat="server" onClick="fn_analysis_home_10()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label71" runat="server" Text="HOSES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                                     <asp:Table ID="T13" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow10" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_13" CssClass="roundcorners">
                                     <asp:Panel ID="ANALYSIS_HOME_11" runat="server" onClick="fn_analysis_home_11()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label75" runat="server" Text="TYRES" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                                      <asp:Table ID="T14" runat="server" Height="75px" Style="cursor: pointer" Width="380px">
                            <asp:TableRow ID="TableRow11" runat="server">
                                <asp:TableCell runat="server" ID="ID_CELL_14" CssClass="roundcorners">
                                     <asp:Panel ID="ANALYSIS_HOME_12" runat="server" onClick="fn_analysis_home_12()" BackColor="#ff9664">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2">
                                                    <img src="../IMAGES/Icons_Black/DASHBORAD.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&nbsp;<asp:Label ID="Label78" runat="server" Text="STATISTICS" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                      </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table></td>
                                <td height="100%" style="padding-left: 15px" valign="top">
                                    &nbsp;</td>
                            </tr>
                              <tr>
                                <td height="75px" style="padding-left: 1px" valign="top">
                       
                                    &nbsp;</td>
                                <td height="75px" style="padding-left: 1px" colspan="3" valign="top">
                       
                                </td>
                                <td height="75px" style="padding-left: 15px" colspan="2" valign="top">
                       
                                </td>
                                <td height="75px" style="padding-left: 15px" colspan="2" valign="top">
                                    &nbsp;</td>
                                <td height="75px" style="padding-left: 15px" colspan="2" valign="top">
                                    &nbsp;</td>
                                <td height="75px" style="padding-left: 15px" valign="top">
                                    &nbsp;</td>
                            </tr>
                             <tr>
                                <td height="100%" style="padding-left: 1px" valign="top">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 1px" colspan="3" valign="top">
                                <asp:Table ID="T11" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="True">
                                    <asp:TableRow ID="TableRow46" runat="server">
                                        <asp:TableCell ID="ID_CELL_11" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="REQUEST_Panel_1" runat="server" onClick="fn_OnClickRequestAsset()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/ASSET_MOVEMENT_REQUEST_NB.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label64" runat="server" Text="REQUEST ASSET MOVEMENT" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                                <asp:Table ID="T12" runat="server" Height="75px" Style="cursor: pointer" Width="380px" Visible="True">
                                    <asp:TableRow ID="TableRow47" runat="server">
                                        <asp:TableCell ID="ID_CELL_12" runat="server" CssClass="roundcorners">
                                     <asp:Panel ID="REQUEST_Panel_2" runat="server" onClick="fn_OnClickRequestPart()" CssClass="roundcorners" BackColor="#e7e7e7">
                                        <table border="0">
                                            <tr>
                                                <td class="metro_400x75_cell_content_top" colspan="2" >
                                                     <img src="../IMAGES/Icons_Black/ASSET_PARTS.png" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="metro_400x75_cell_content_bottom_left">&#160;<asp:Label ID="Label65" runat="server" Text="REQUEST PART" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                </td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                                    <%--<asp:Timer ID="Timer" OnTick="Timer_Tick" runat="server" Interval="300000">
                                    </asp:Timer>--%>
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" colspan="2" valign="top">
                                    &nbsp;</td>
                                <td height="100%" style="padding-left: 15px" valign="top">
                                    &nbsp;</td>
                            </tr>
                            </table>
                    </td>
                </tr>
    
                    </table>
                    </div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
        <asp:ImageButton ID="btn_home" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_analysis" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_condition_monitoring" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_event_dashboard" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_data_input" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_reports" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_asset_management" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_component_management" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_customer_management" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_event_management" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_servicing" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_plant_activity" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:ImageButton ID="btn_system_administration" runat="server" ImageUrl="~/IMAGES/save_silk_58_100.png" BackColor="White" />
        <asp:HiddenField ID="HF_button" runat="server" Value="Home" />
        <asp:HiddenField ID="HF_Username" runat="server" />
        <asp:HiddenField ID="HF_EXCEPTION_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_2_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_2_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_4_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_4_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_5_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_5_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_6_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_6_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_7_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_7_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_8_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_8_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_9" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_10_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_10_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_11_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_11_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_12" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_13" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_14" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_16" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_17" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_18_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_18_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_19_R" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EXCEPTION_19_RW" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_7" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_8" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_9" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_10" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_11" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_12" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ANALYSIS_13" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ASSETMAN_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_7" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CONMON_8" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_COMMAN_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_CUSMAN_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTD_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_EVENTMAN_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_7" runat="server" Value="0" />
        <asp:HiddenField ID="HF_DATAINPUT_8" runat="server" Value="0" />
        <asp:HiddenField ID="HF_SERVICING_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REPORTS_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REPORTS_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REPORTS_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REPORTS_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ACTIVITY_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_0" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_2" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_3" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_4" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_5" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_6" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_7" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_8" runat="server" Value="0" />
        <asp:HiddenField ID="HF_ADMIN_9" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REQUEST_1" runat="server" Value="0" />
        <asp:HiddenField ID="HF_REQUEST_2" runat="server" Value="0" />

        <asp:HiddenField ID="WT_Area" runat="server" Value="HOME"/>
        <asp:HiddenField ID="WT_No" runat="server" />
         <asp:HiddenField ID="WT_Name" runat="server" Value="tbc" />
        <asp:HiddenField ID="WT_Desc" runat="server" Value="tbc" />
        <asp:HiddenField ID="WT_Green" runat="server" Value="0" />
         <asp:HiddenField ID="WT_Amber" runat="server" Value="0" />
         <asp:HiddenField ID="WT_Red" runat="server" Value="0" />

        <asp:HiddenField ID="HF_1" runat="server" />
        <asp:HiddenField ID="HF_2" runat="server" />
        <asp:HiddenField ID="HF_3" runat="server" />
        <asp:HiddenField ID="HF_4" runat="server" />
        <asp:HiddenField ID="HF_5" runat="server" />
        <asp:HiddenField ID="HF_6" runat="server" />
        <asp:HiddenField ID="HF_7" runat="server" />
        <asp:HiddenField ID="HF_8" runat="server" />
        <asp:HiddenField ID="HF_9" runat="server" />
        <asp:HiddenField ID="HF_CUS_ID" runat="server" Value="0" />
        <asp:HiddenField ID="HF_Toggle" runat="server" Value="1" />
        <asp:HiddenField ID="HF_PageCount" runat="server" Value="0" />
            <asp:HiddenField ID="HF_PageName" runat="server" />
            <asp:HiddenField ID="HF_Row" runat="server"/>
            <asp:HiddenField ID="HF_GUID" runat="server" />
            <asp:HiddenField ID="HF_PreviousPage" runat="server" />
        <asp:HiddenField ID="HF_SessionIP" runat="server" />
        <asp:HiddenField ID="HF_Session_ID" runat="server" />
        <asp:HiddenField ID="HF_Client_APP_ID" runat="server" />
        <asp:HiddenField ID="HF_EMP_ID" runat="server" />
        <asp:HiddenField ID="HF_PQQ_Permission" runat="server" />
        <asp:SqlDataSource ID="SqlDS_Box6" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_SP" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box6_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box7" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_SP" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box7_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDS_Box8" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_SP" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDS_Box8_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDS_Box9" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_SP" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDS_Box9_LW" runat="server"
            ConnectionString="<%$ ConnectionStrings:CAMSConnectionString %>"
            SelectCommand="HOME_AVERAGE_BREAKDOWN_LENGTH_LW_SP" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
<%--        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Glow">
            </telerik:RadAjaxLoadingPanel>--%>
<%--            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" UpdatePanelsRenderMode="Inline" RequestQueueSize="1">--%>
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" RequestQueueSize="1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="btn_home">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_analysis">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                         <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_condition_monitoring">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_event_dashboard">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_data_input">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_reports">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_asset_management">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_component_management">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="btn_customer_management">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_event_management">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_servicing">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="btn_plant_activity">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1" />
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="btn_system_administration">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="lblTitle" />
                        <telerik:AjaxUpdatedControl ControlID="HF_button" />
                        <telerik:AjaxUpdatedControl ControlID="T1"/>
                        <telerik:AjaxUpdatedControl ControlID="T6" />
                        <telerik:AjaxUpdatedControl ControlID="T2" />
                        <telerik:AjaxUpdatedControl ControlID="T7" />
                        <telerik:AjaxUpdatedControl ControlID="T3" />
                        <telerik:AjaxUpdatedControl ControlID="T8" />
                        <telerik:AjaxUpdatedControl ControlID="T4" />
                        <telerik:AjaxUpdatedControl ControlID="T9" />
                        <telerik:AjaxUpdatedControl ControlID="T5" />
                        <telerik:AjaxUpdatedControl ControlID="T10" />
                        <telerik:AjaxUpdatedControl ControlID="T11" />
                        <telerik:AjaxUpdatedControl ControlID="T12" />
                        <telerik:AjaxUpdatedControl ControlID="T13" />
                        <telerik:AjaxUpdatedControl ControlID="T14" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    </form>
</body>
</html>

