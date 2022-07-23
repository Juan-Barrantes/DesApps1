
namespace ProyAutoServicios_GUI
{
    partial class Servicio02
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
            this.grpDatos = new System.Windows.Forms.GroupBox();
            this.cboAgencia = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.mskTiempoServ = new System.Windows.Forms.MaskedTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnGrabar = new System.Windows.Forms.Button();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtServicio = new System.Windows.Forms.TextBox();
            this.grpDatos.SuspendLayout();
            this.SuspendLayout();
            // 
            // grpDatos
            // 
            this.grpDatos.Controls.Add(this.txtServicio);
            this.grpDatos.Controls.Add(this.cboAgencia);
            this.grpDatos.Controls.Add(this.label4);
            this.grpDatos.Controls.Add(this.mskTiempoServ);
            this.grpDatos.Controls.Add(this.label1);
            this.grpDatos.Controls.Add(this.btnCancelar);
            this.grpDatos.Controls.Add(this.btnGrabar);
            this.grpDatos.Controls.Add(this.txtPrecio);
            this.grpDatos.Controls.Add(this.label3);
            this.grpDatos.Controls.Add(this.label2);
            this.grpDatos.Location = new System.Drawing.Point(13, 14);
            this.grpDatos.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.grpDatos.Name = "grpDatos";
            this.grpDatos.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.grpDatos.Size = new System.Drawing.Size(457, 288);
            this.grpDatos.TabIndex = 1;
            this.grpDatos.TabStop = false;
            this.grpDatos.Text = "Datos";
            // 
            // cboAgencia
            // 
            this.cboAgencia.FormattingEnabled = true;
            this.cboAgencia.Location = new System.Drawing.Point(177, 166);
            this.cboAgencia.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cboAgencia.Name = "cboAgencia";
            this.cboAgencia.Size = new System.Drawing.Size(172, 24);
            this.cboAgencia.TabIndex = 10;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(35, 170);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(59, 17);
            this.label4.TabIndex = 9;
            this.label4.Text = "Agencia";
            // 
            // mskTiempoServ
            // 
            this.mskTiempoServ.Location = new System.Drawing.Point(177, 134);
            this.mskTiempoServ.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.mskTiempoServ.Mask = "99";
            this.mskTiempoServ.Name = "mskTiempoServ";
            this.mskTiempoServ.Size = new System.Drawing.Size(49, 22);
            this.mskTiempoServ.TabIndex = 8;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(35, 134);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(116, 17);
            this.label1.TabIndex = 7;
            this.label1.Text = "Tiempo estimado";
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(160, 210);
            this.btnCancelar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(100, 28);
            this.btnCancelar.TabIndex = 6;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnGrabar
            // 
            this.btnGrabar.Location = new System.Drawing.Point(297, 210);
            this.btnGrabar.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnGrabar.Name = "btnGrabar";
            this.btnGrabar.Size = new System.Drawing.Size(100, 28);
            this.btnGrabar.TabIndex = 5;
            this.btnGrabar.Text = "Grabar";
            this.btnGrabar.UseVisualStyleBackColor = true;
            this.btnGrabar.Click += new System.EventHandler(this.btnGrabar_Click);
            // 
            // txtPrecio
            // 
            this.txtPrecio.Location = new System.Drawing.Point(177, 90);
            this.txtPrecio.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.Size = new System.Drawing.Size(80, 22);
            this.txtPrecio.TabIndex = 4;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(31, 90);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(52, 17);
            this.label3.TabIndex = 3;
            this.label3.Text = "Precio:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(31, 49);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(94, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tipo Servicio:";
            // 
            // txtServicio
            // 
            this.txtServicio.Location = new System.Drawing.Point(177, 43);
            this.txtServicio.Name = "txtServicio";
            this.txtServicio.Size = new System.Drawing.Size(100, 22);
            this.txtServicio.TabIndex = 12;
            // 
            // Servicio02
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(487, 316);
            this.Controls.Add(this.grpDatos);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "Servicio02";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Insertar Servicio";
            this.Load += new System.EventHandler(this.Servicio02_Load);
            this.grpDatos.ResumeLayout(false);
            this.grpDatos.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpDatos;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnGrabar;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cboAgencia;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.MaskedTextBox mskTiempoServ;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtServicio;
    }
}