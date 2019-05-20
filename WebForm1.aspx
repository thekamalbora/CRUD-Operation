   <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CrudOpperationSimpleInDotNet.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="dvGrid" style="padding: 10px; width: 450px">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="CustomerId" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "3" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="450">
            <Columns>
                <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCountry" runat="server" Text='<%# Eval("Country") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 150px">
                    Name:<br />
                    <asp:TextBox ID="txtName" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Country:<br />
                    <asp:TextBox ID="txtCountry" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
        </form>
</body>
</html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.js"></script>

<script type="text/javascript">
    $(function () {
        BlockUI("dvGrid");
        $.blockUI.defaults.css = {};
    });
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance(); 
        prm.add_beginRequest(function () {
            $("#" + elementID).block({
                message: '<div align = "center">' + '<img src="loadingAnimation.gif"/></div>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    };
</script>