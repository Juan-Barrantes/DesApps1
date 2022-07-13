<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaServicio.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.Servicio.ConsultaServicio" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<p class="tituloForm">Consulta Servicios</p>
    <table class="auto-style1">
        <tr>
            <td class="labelContenido">Seleccione tipo de Servicio:</td>
            <td class="auto-style5">
                <asp:DropDownList ID="cboTipoServicio" runat="server" CssClass="DropDownList" Width="300px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="labelContenido">Ingrese fecha de Registro(*, Obligatorio):</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtFecRegistro" runat="server" CssClass="TextBoxDerecha" Width="200px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtFecRegistro_CalendarExtender" runat="server" BehaviorID="txtFecRegistro_CalendarExtender" TargetControlID="txtFecRegistro">
                </ajaxToolkit:CalendarExtender>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFecRegistro" CssClass="labelErrores" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style6">
                <asp:Button ID="btnConsultar" runat="server" CssClass="boton-new" Text="Consultar" OnClick="btnConsultar_Click" />
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblRegistros" runat="server" CssClass="labelErrores"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:HyperLink ID="HyperLink1" runat="server">Retornar</asp:HyperLink>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="grvConsulta" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnPageIndexChanging="grvConsulta_PageIndexChanging" PageSize="5" Width="873px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="codServicios" HeaderText="Codigo Servicio">
            <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="tipoServ" HeaderText="Tipo de Servicio">
            <ItemStyle Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="precio" HeaderText="Precio (S/.)">
            <ItemStyle HorizontalAlign="Right" Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="fecRegistro" HeaderText="Fecha de Registro">
            <ItemStyle Width="90px" />
            </asp:BoundField>
            <asp:BoundField DataField="Socio" HeaderText="Socio">
            <ItemStyle Width="120px" />
            </asp:BoundField>
            <asp:BoundField DataField="Tiempo Estimado" HeaderText="Tiempo Estimado">
            <ItemStyle Width="60px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>

    <br />
    <%--Este es el modal popup  que contiene los mensajes --%>                <%--1 Control target (cualquier control)--%>
              <asp:LinkButton ID="lnkMensaje" runat="server" ></asp:LinkButton>
    <%--2 el panel que se mostrara en el popup--%>
              <asp:Panel ID="pnlMensaje" runat="server" CssClass="CajaDialogo" Style="display: normal;" Width="500"> 
                    <table border="0" width="500px" style="margin: 0px; padding: 0px; background-color:darkred ; 
                        color: #FFFFFF;"> 
                        <tr> 
                            <td align="center"> 
                                <asp:Label ID="lblTitulo" runat="server" Text="Mensaje" /> 
                            </td> 
                            <td width="12%" class="center"> 
                                <asp:ImageButton ID="btnCerrar" runat="server" ImageUrl="~/Images/Cancelar.png" Style="vertical-align: top;" 
                                    ImageAlign="Right" /> 
                            </td> 
                        </tr> 
                         
                    </table> 
                    <div> 
                        <asp:Label ID="lblMensaje" runat="server" Text="" ForeColor ="Black" /> 
                    </div> 
                    <div> 
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CausesValidation="False" /> 
                    </div> 
                </asp:Panel> 
    <%--3 el Modal popup que hace referencia al control target  (1) y al panel (2)--%>
                <ajaxToolkit:ModalPopupExtender ID="mpMensaje" runat="server" TargetControlID="lnkMensaje" 
                    PopupControlID="pnlMensaje" BackgroundCssClass="FondoAplicacion"  OkControlID="btnAceptar" />

</asp:Content>

