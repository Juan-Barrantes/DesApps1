<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaClienteEstado.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.Factura.ConsultaClienteEstado" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate >
    <p class="tituloForm">
        Listado paginado de Facturas</p>
   
        <table class="auto-style2" >
            <tr>
                <td class="labelContenido" style="width: 276px">Seleccione cliente:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="cboCliente" runat="server" Width="300px" CssClass="DropDownList">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="labelContenido" style="width: 276px">Seleccione estado:</td>
                <td class="auto-style8">
                    <asp:DropDownList ID="cboEstado" runat="server" CssClass="DropDownList" Width="300px">
                        <asp:ListItem Selected="True" Value="X">--Todos--</asp:ListItem>
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Cancelada</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnFiltrar" runat="server" CssClass="boton2" OnClick="btnFiltrar_Click" Text="Filtrar" Width="100px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="labelErrores"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="3">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Mantenimiento/Consultas.aspx">Retornar</asp:HyperLink>
                </td>
            </tr>
            </table>
            
                    <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1287px" CssClass="GriedView" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="codComprobante" HeaderText="Nro. Factura" />
                            <asp:BoundField DataField="docIdentidad" HeaderText="Nro Documento" >
                            </asp:BoundField>
                            <asp:BoundField DataField="codServicio" HeaderText="Cod Servicio" >
                            </asp:BoundField>
                            <asp:BoundField DataField="tipoServ" HeaderText="Servicio" >
                            </asp:BoundField>
                            <asp:BoundField DataField="EstadoActual" HeaderText="Estado" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
            <table>
            <tr>
                <td class="auto-style2">
                    <asp:DropDownList ID="cboPaginas" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="cboPaginas_SelectedIndexChanged" CssClass="DropDownList">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">&nbsp;</td>
             </tr>
        </table>
            </ContentTemplate>
   </asp:UpdatePanel>
 <!--        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="0"  AssociatedUpdatePanelID ="UpdatePanel1">
          <ProgressTemplate>
              <div class="overlay">
                  <div class="overlayContent ">
                  <h2>Cargando</h2>  
                  <img src="../Images/loading.gif" alt ="Loading" border="0" />              
              </div>
              </div>
          </ProgressTemplate>
    </asp:UpdateProgress>   -->
</asp:Content>

