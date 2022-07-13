<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultasFacturas.aspx.cs" Inherits="SitioVentasWEB_GUI.Consultas.ConsultasFacturas" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="tituloForm">
        CONSULTA DE FACTURAS</p>
    <table class="auto-style8">
        <tr>
            <td class="auto-style1" >Nro de Documento:</td>
            <td width="150px" class="auto-style2">
                <asp:TextBox ID="txtdoc" runat="server" CssClass="TextBoxDerecha" MaxLength="15" Width="100px"></asp:TextBox>
            &nbsp;
                <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/Images/Buscar.png" OnClick="btnBuscar_Click" style="width: 16px" CausesValidation="False"  />
            </td>
            <td class="auto-style1">Nombre Completo:</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtNombre" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="labelContenido">Ubigeo</td>
            <td>
                <asp:TextBox ID="txtUbigeo" runat="server" CssClass="TextBoxDerecha" Width="400px" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style9">Estado:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtEstado" runat="server" CssClass="TextBoxDerecha" Width="120px" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Direccion:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDir" runat="server" CssClass="TextBoxDerecha" Width="400px" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="labelContenido">Telefono:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtTel" runat="server" CssClass="TextBoxDerecha" Width="120px" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="labelTitulo" colspan="4">INGRESE FECHAS DE CONSULTA ( * Obligatorios):</td>
        </tr>
        <tr>
            <td class="labelContenido">Fecha inicio (*):</td>
            <td>
                <asp:TextBox ID="txtFecIni" runat="server" CssClass="TextBoxDerecha" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtFecIni_CalendarExtender" runat="server" BehaviorID="txtFecIni_CalendarExtender" TargetControlID="txtFecIni" />
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFecIni" CssClass="labelErrores" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style9">Fecha fin (*):</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtFecFin" runat="server" CssClass="TextBoxDerecha" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtFecFin_CalendarExtender" runat="server" BehaviorID="txtFecFin_CalendarExtender" TargetControlID="txtFecFin" />
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFecFin" CssClass="labelErrores" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnConsultar" runat="server" CssClass="boton2" OnClick="btnConsultar_Click" Text="Consultar" />
            </td>
            <td class="auto-style11">&nbsp;</td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style1">
                <asp:Label ID="lblRegistros" runat="server" CssClass="labelErrores"></asp:Label>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Mantenimiento/Consultas.aspx">Retornar</asp:HyperLink>
            </td>
            <td class="auto-style7">&nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1155px" CssClass="GriedView" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="codComprobante" HeaderText="Nro. factura" />
            <asp:BoundField DataField="fechaEmision" DataFormatString="{0:d}" HeaderText="Fec. facturacion" />
            <asp:BoundField DataField="fech_ult_mod" DataFormatString="{0:d}" HeaderText="Fec. cancelacion" />
            <asp:BoundField DataField="docIdentidad" HeaderText="N° Documento" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" />
            <asp:BoundField DataField="precio" DataFormatString="{0:n}" HeaderText="Precio(s/.)" />
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
    <%--Este es el modal popup  que contiene los mensajes --%>                <%--1 Control target (cualquier control)--%>
    <asp:LinkButton ID="lnkMensaje" runat="server" ></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="mpMensaje" runat="server" TargetControlID="lnkMensaje" 
                    PopupControlID="pnlMensaje" BackgroundCssClass="FondoAplicacion"  OkControlID="btnAceptar" />
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
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="lnkMensaje" 
                    PopupControlID="pnlMensaje" BackgroundCssClass="FondoAplicacion"  OkControlID="btnAceptar" />

</asp:Content>
