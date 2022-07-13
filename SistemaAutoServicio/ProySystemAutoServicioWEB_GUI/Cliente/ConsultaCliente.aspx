<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaCliente.aspx.cs" Inherits="ProySystemAutoServicioWEB_GUI.Mantenimiento.Cliente.ConsultaCliente" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>




<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="CSS/DemoCSS.css" rel="stylesheet" type="text/css" />

    <p class="tituloForm">Consulta de Clientes</p>
    <table class="auto-style1">
        <tr>
            <td class="labelContenido" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">Presione para listar Clientes</td>
            <td class="auto-style5">
                <asp:Button ID="btnConsultar" runat="server" CssClass="boton-new" Text="Listar" OnClick="btnConsultar_Click" />
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="3">
                <asp:Label ID="lblRegistros" runat="server" CssClass="labelErrores"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="3">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Mantenimiento/Consultas.aspx" ViewStateMode="Disabled">Retornar</asp:HyperLink>
            </td>
        </tr>
        
    </table>
    
    <asp:GridView ID="grvClientes" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#FFFF99" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" Width="1100px" OnPageIndexChanging="grvClientes_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="docIdentidad" HeaderText="docIdentidad" />
            <asp:BoundField DataField="tipoDocumento" HeaderText="tipoDocumento" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" />
            <asp:BoundField DataField="apellidos" HeaderText="apellidos" />
            <asp:BoundField DataField="direccion" HeaderText="Dirección" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#333333" HorizontalAlign="Left" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
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

