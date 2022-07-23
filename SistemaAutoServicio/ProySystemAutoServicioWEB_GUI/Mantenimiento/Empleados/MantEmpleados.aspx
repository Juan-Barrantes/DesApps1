<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantEmpleados.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.MantEmpleados" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Consulta Empleados</h3>
    <p>&nbsp;</p>
    <table style="width: 80%; height: 279px">
        <tr>
            <td style="width: 146px">Codigo Empleado</td>
            <td class="modal-sm" style="width: 399px">
                <asp:TextBox ID="txtCod" runat="server"></asp:TextBox>
            </td>
            <td style="width: 100px">
                <asp:Button ID="btnConsultar" runat="server" OnClick="btnConsultar_Click" Text="Consultar" />
            </td>
            <td style="width: 100px">
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5" style="height: 187px">
                <asp:GridView ID="grvEmpleados" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="1093px" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="codEmpleado" HeaderText="Codigo" />
                        <asp:BoundField DataField="nomEmpleado" HeaderText="Nombre" />
                        <asp:BoundField DataField="apeEmpleado" HeaderText="Apellidos" />
                        <asp:BoundField DataField="dirEmpleado" HeaderText="Dirección" />
                        <asp:BoundField DataField="telefono" HeaderText="Teléfono" />
                        <asp:BoundField DataField="cargo" HeaderText="Cargo" />
                        <asp:BoundField DataField="correo" HeaderText="Correo" />
                    </Columns>
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
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Mantenimiento/Consultas.aspx">Retornar</asp:HyperLink>
            </td>
            <td class="modal-sm" style="height: 47px; width: 399px">&nbsp;</td>
            <td style="height: 47px; width: 100px">
                &nbsp;</td>
            <td style="width: 100px; height: 47px">
                &nbsp;</td>
            <td style="height: 47px">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
