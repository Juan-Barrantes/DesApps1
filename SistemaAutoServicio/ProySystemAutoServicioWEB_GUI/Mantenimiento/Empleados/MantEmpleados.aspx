<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantEmpleados.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.MantEmpleados" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Mantenimiento Tabla Empleados</h3>
    <p>&nbsp;</p>
    <table style="width: 80%; height: 279px">
        <tr>
            <td style="width: 146px">Nombre Usuario</td>
            <td class="modal-sm" style="width: 399px">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 100px">Total:</td>
            <td>
                <asp:Label ID="lblTotal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 187px">
                <asp:GridView ID="grvEmpleados" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="562px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 47px">
                <asp:Label ID="lblMensaje" runat="server" ForeColor="#FF0066" Width="600px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 146px; height: 47px">
                <asp:HyperLink ID="HyperLink1" runat="server">Retornar</asp:HyperLink>
            </td>
            <td class="modal-sm" style="height: 47px; width: 399px">&nbsp;</td>
            <td style="height: 47px; width: 100px">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" />
            </td>
            <td style="width: 100px; height: 47px">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" />
            </td>
            <td style="height: 47px">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
    </table>
</asp:Content>
