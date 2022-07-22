
namespace ProyAutoServicios_GUI
{
    partial class frmPagoFacturas
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.txtFiltro = new System.Windows.Forms.TextBox();
            this.grvFacturas = new System.Windows.Forms.DataGridView();
            this.btnVerDetalle = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.lblTotal = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.codComprobantes = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.docIdentidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cliente = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.grvFacturas)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(145, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "N° Documento cliente";
            // 
            // txtFiltro
            // 
            this.txtFiltro.Location = new System.Drawing.Point(200, 13);
            this.txtFiltro.Name = "txtFiltro";
            this.txtFiltro.Size = new System.Drawing.Size(146, 22);
            this.txtFiltro.TabIndex = 1;
            this.txtFiltro.TextChanged += new System.EventHandler(this.txtFiltro_TextChanged);
            // 
            // grvFacturas
            // 
            this.grvFacturas.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grvFacturas.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.grvFacturas.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grvFacturas.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codComprobantes,
            this.docIdentidad,
            this.cliente,
            this.precio});
            this.grvFacturas.Location = new System.Drawing.Point(31, 63);
            this.grvFacturas.Name = "grvFacturas";
            this.grvFacturas.ReadOnly = true;
            this.grvFacturas.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.Single;
            this.grvFacturas.RowHeadersVisible = false;
            this.grvFacturas.RowHeadersWidth = 51;
            this.grvFacturas.RowTemplate.Height = 24;
            this.grvFacturas.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.grvFacturas.Size = new System.Drawing.Size(812, 293);
            this.grvFacturas.TabIndex = 2;
            this.grvFacturas.DoubleClick += new System.EventHandler(this.grvFacturas_DoubleClick);
            // 
            // btnVerDetalle
            // 
            this.btnVerDetalle.Location = new System.Drawing.Point(747, 395);
            this.btnVerDetalle.Name = "btnVerDetalle";
            this.btnVerDetalle.Size = new System.Drawing.Size(96, 23);
            this.btnVerDetalle.TabIndex = 3;
            this.btnVerDetalle.Text = "ver detalle";
            this.btnVerDetalle.UseVisualStyleBackColor = true;
            this.btnVerDetalle.Click += new System.EventHandler(this.btnVerDetalle_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.Location = new System.Drawing.Point(635, 395);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(75, 23);
            this.btnSalir.TabIndex = 4;
            this.btnSalir.Text = "salir";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Location = new System.Drawing.Point(527, 40);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(32, 17);
            this.lblTotal.TabIndex = 5;
            this.lblTotal.Text = "      ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(445, 39);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(40, 17);
            this.label2.TabIndex = 6;
            this.label2.Text = "Total";
            // 
            // codComprobantes
            // 
            this.codComprobantes.DataPropertyName = "codComprobante";
            this.codComprobantes.HeaderText = "N° Factura";
            this.codComprobantes.MinimumWidth = 6;
            this.codComprobantes.Name = "codComprobantes";
            this.codComprobantes.ReadOnly = true;
            // 
            // docIdentidad
            // 
            this.docIdentidad.DataPropertyName = "docIdentidad";
            this.docIdentidad.HeaderText = "N° Documento";
            this.docIdentidad.MinimumWidth = 6;
            this.docIdentidad.Name = "docIdentidad";
            this.docIdentidad.ReadOnly = true;
            // 
            // cliente
            // 
            this.cliente.DataPropertyName = "cliente";
            this.cliente.HeaderText = "Cliente";
            this.cliente.MinimumWidth = 6;
            this.cliente.Name = "cliente";
            this.cliente.ReadOnly = true;
            // 
            // precio
            // 
            this.precio.DataPropertyName = "precio";
            this.precio.HeaderText = "Total";
            this.precio.MinimumWidth = 6;
            this.precio.Name = "precio";
            this.precio.ReadOnly = true;
            // 
            // frmPagoFacturas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(867, 441);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnVerDetalle);
            this.Controls.Add(this.grvFacturas);
            this.Controls.Add(this.txtFiltro);
            this.Controls.Add(this.label1);
            this.Name = "frmPagoFacturas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Facturas pendientes";
            this.Load += new System.EventHandler(this.frmPagoFacturas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.grvFacturas)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtFiltro;
        private System.Windows.Forms.DataGridView grvFacturas;
        private System.Windows.Forms.Button btnVerDetalle;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridViewTextBoxColumn codComprobantes;
        private System.Windows.Forms.DataGridViewTextBoxColumn docIdentidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn cliente;
        private System.Windows.Forms.DataGridViewTextBoxColumn precio;
    }
}