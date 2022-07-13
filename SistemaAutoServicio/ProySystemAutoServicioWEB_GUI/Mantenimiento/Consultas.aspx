<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="SitioVentasWEB_GUI.Consultas.Consultas" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p class="tituloForm">CONSULTAS DEL SISTEMA</p>
    <table>
        <tr>
            <td class="style2">
                <asp:Image ID="Image1" runat="server" Height="267px" 
                    ImageUrl="~/Images/Consultas.jpg" Width="274px" />
            </td>
            <td>
                
                <asp:TreeView ID="TreeView1" runat="server" Height="114px" ImageSet="BulletedList4" ShowExpandCollapse="False" Width="222px">
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <Nodes>
                        <asp:TreeNode Text="Consultas del sistema" Value="Consultas del sistema">
                            <asp:TreeNode NavigateUrl="~/Cliente/ConsultaCliente.aspx" Text="Facturacion del cliente" Value="Facturacion del cliente"></asp:TreeNode>
                            <asp:TreeNode Text="Consulta Empleados" Value="Facturacion del vendedor" NavigateUrl="~/Mantenimiento/Empleados/MantEmpleados.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Listado paginado de Facturas" Value="Listado paginado de Facturas" NavigateUrl="~/Mantenimiento/Factura/ConsultasFacturas.aspx"></asp:TreeNode>
                            <asp:TreeNode NavigateUrl="~/Mantenimiento/Servicio/ConsultaServicio.aspx" Text="Consulta Servicios" Value="Consulta Servicios"></asp:TreeNode>
                            <asp:TreeNode Text="Paginacion" Value="Retornar" NavigateUrl="~/Mantenimiento/Factura/ConsultaClienteEstado.aspx"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                </asp:TreeView>
                
            </td>
        </tr>
    </table>
&nbsp;
</asp:Content>


