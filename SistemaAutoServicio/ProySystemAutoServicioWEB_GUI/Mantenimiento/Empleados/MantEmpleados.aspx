<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantEmpleados.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.MantEmpleados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Mantenimiento Tabla Empleados</h3>
    <p>&nbsp;</p>
    <table style="width: 80%">
        <tr>
            <td style="width: 146px">Nombre Usuario</td>
            <td class="modal-sm" style="width: 399px">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td style="width: 100px">&nbsp;</td>
            <td style="width: 100px">Total:</td>
            <td>
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="height: 187px"></td>
        </tr>
        <tr>
            <td style="width: 146px; height: 47px"></td>
            <td class="modal-sm" style="height: 47px; width: 399px"></td>
            <td style="height: 47px; width: 100px">
                <asp:Button ID="btnInsertar" runat="server" Text="Insertar" />
            </td>
            <td style="width: 100px; height: 47px">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" />
            </td>
            <td style="height: 47px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
