
namespace ProyAutoServicios_GUI
{
    partial class Empleado01
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
            this.btnCerrar = new System.Windows.Forms.Button();
            this.btnActualizar = new System.Windows.Forms.Button();
            this.btnInsertar = new System.Windows.Forms.Button();
            this.lblTotal = new System.Windows.Forms.Label();
            this.Total = new System.Windows.Forms.Label();
            this.dtgEmpleado = new System.Windows.Forms.DataGridView();
            this.codEmpleado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nombre = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.apellido = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.correo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cargo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sueldo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dirAge = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.departamento = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Provincia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.distrito = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dtgEmpleado)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(34, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "N° documento:";
            // 
            // txtFiltro
            // 
            this.txtFiltro.Location = new System.Drawing.Point(193, 33);
            this.txtFiltro.Name = "txtFiltro";
            this.txtFiltro.Size = new System.Drawing.Size(186, 22);
            this.txtFiltro.TabIndex = 2;
            this.txtFiltro.TextChanged += new System.EventHandler(this.txtFiltro_TextChanged);
            // 
            // btnCerrar
            // 
            this.btnCerrar.Location = new System.Drawing.Point(1067, 522);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(75, 23);
            this.btnCerrar.TabIndex = 14;
            this.btnCerrar.Text = "Cerrar";
            this.btnCerrar.UseVisualStyleBackColor = true;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            // 
            // btnActualizar
            // 
            this.btnActualizar.Location = new System.Drawing.Point(939, 522);
            this.btnActualizar.Name = "btnActualizar";
            this.btnActualizar.Size = new System.Drawing.Size(99, 23);
            this.btnActualizar.TabIndex = 13;
            this.btnActualizar.Text = "Actualizar";
            this.btnActualizar.UseVisualStyleBackColor = true;
            this.btnActualizar.Click += new System.EventHandler(this.btnActualizar_Click);
            // 
            // btnInsertar
            // 
            this.btnInsertar.Location = new System.Drawing.Point(823, 522);
            this.btnInsertar.Name = "btnInsertar";
            this.btnInsertar.Size = new System.Drawing.Size(75, 23);
            this.btnInsertar.TabIndex = 10;
            this.btnInsertar.Text = "Insertar";
            this.btnInsertar.UseVisualStyleBackColor = true;
            this.btnInsertar.Click += new System.EventHandler(this.btnInsertar_Click);
            // 
            // lblTotal
            // 
            this.lblTotal.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTotal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblTotal.Location = new System.Drawing.Point(1031, 47);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(100, 23);
            this.lblTotal.TabIndex = 12;
            // 
            // Total
            // 
            this.Total.AutoSize = true;
            this.Total.Location = new System.Drawing.Point(981, 48);
            this.Total.Name = "Total";
            this.Total.Size = new System.Drawing.Size(44, 17);
            this.Total.TabIndex = 11;
            this.Total.Text = "Total:";
            // 
            // dtgEmpleado
            // 
            this.dtgEmpleado.AllowUserToAddRows = false;
            this.dtgEmpleado.AllowUserToDeleteRows = false;
            this.dtgEmpleado.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgEmpleado.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgEmpleado.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgEmpleado.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.codEmpleado,
            this.nombre,
            this.apellido,
            this.correo,
            this.Cargo,
            this.sueldo,
            this.dirAge,
            this.departamento,
            this.Provincia,
            this.distrito});
            this.dtgEmpleado.Location = new System.Drawing.Point(13, 86);
            this.dtgEmpleado.Margin = new System.Windows.Forms.Padding(4);
            this.dtgEmpleado.Name = "dtgEmpleado";
            this.dtgEmpleado.ReadOnly = true;
            this.dtgEmpleado.RowHeadersVisible = false;
            this.dtgEmpleado.RowHeadersWidth = 51;
            this.dtgEmpleado.RowTemplate.Height = 24;
            this.dtgEmpleado.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgEmpleado.Size = new System.Drawing.Size(1129, 418);
            this.dtgEmpleado.TabIndex = 15;
            this.dtgEmpleado.DoubleClick += new System.EventHandler(this.dtgEmpleado_DoubleClick);
            // 
            // codEmpleado
            // 
            this.codEmpleado.DataPropertyName = "codEmpleado";
            this.codEmpleado.HeaderText = "Cod. Empleado";
            this.codEmpleado.MinimumWidth = 6;
            this.codEmpleado.Name = "codEmpleado";
            this.codEmpleado.ReadOnly = true;
            // 
            // nombre
            // 
            this.nombre.DataPropertyName = "nomEmpleado";
            this.nombre.HeaderText = "Nombre";
            this.nombre.MinimumWidth = 6;
            this.nombre.Name = "nombre";
            this.nombre.ReadOnly = true;
            // 
            // apellido
            // 
            this.apellido.DataPropertyName = "apeEmpleado";
            this.apellido.HeaderText = "Apellidos";
            this.apellido.MinimumWidth = 6;
            this.apellido.Name = "apellido";
            this.apellido.ReadOnly = true;
            // 
            // correo
            // 
            this.correo.DataPropertyName = "correo";
            this.correo.HeaderText = "Correo";
            this.correo.MinimumWidth = 6;
            this.correo.Name = "correo";
            this.correo.ReadOnly = true;
            // 
            // Cargo
            // 
            this.Cargo.DataPropertyName = "cargo";
            this.Cargo.HeaderText = "Cargo";
            this.Cargo.MinimumWidth = 6;
            this.Cargo.Name = "Cargo";
            this.Cargo.ReadOnly = true;
            // 
            // sueldo
            // 
            this.sueldo.DataPropertyName = "sueldo";
            this.sueldo.HeaderText = "Sueldo";
            this.sueldo.MinimumWidth = 6;
            this.sueldo.Name = "sueldo";
            this.sueldo.ReadOnly = true;
            // 
            // dirAge
            // 
            this.dirAge.DataPropertyName = "direccion";
            this.dirAge.HeaderText = "Agencia - oficina";
            this.dirAge.MinimumWidth = 6;
            this.dirAge.Name = "dirAge";
            this.dirAge.ReadOnly = true;
            // 
            // departamento
            // 
            this.departamento.DataPropertyName = "Departamento";
            this.departamento.HeaderText = "Departamento";
            this.departamento.MinimumWidth = 6;
            this.departamento.Name = "departamento";
            this.departamento.ReadOnly = true;
            // 
            // Provincia
            // 
            this.Provincia.DataPropertyName = "Provincia";
            this.Provincia.HeaderText = "Provincia";
            this.Provincia.MinimumWidth = 6;
            this.Provincia.Name = "Provincia";
            this.Provincia.ReadOnly = true;
            // 
            // distrito
            // 
            this.distrito.DataPropertyName = "Distrito";
            this.distrito.HeaderText = "Distrito";
            this.distrito.MinimumWidth = 6;
            this.distrito.Name = "distrito";
            this.distrito.ReadOnly = true;
            // 
            // Empleado01
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1170, 557);
            this.Controls.Add(this.dtgEmpleado);
            this.Controls.Add(this.btnCerrar);
            this.Controls.Add(this.btnActualizar);
            this.Controls.Add(this.btnInsertar);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.Total);
            this.Controls.Add(this.txtFiltro);
            this.Controls.Add(this.label1);
            this.Name = "Empleado01";
            this.Text = "Mantenimiento Empleados";
            this.Load += new System.EventHandler(this.Empleado01_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgEmpleado)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtFiltro;
        private System.Windows.Forms.Button btnCerrar;
        private System.Windows.Forms.Button btnActualizar;
        private System.Windows.Forms.Button btnInsertar;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label Total;
        private System.Windows.Forms.DataGridView dtgEmpleado;
        private System.Windows.Forms.DataGridViewTextBoxColumn codEmpleado;
        private System.Windows.Forms.DataGridViewTextBoxColumn nombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn apellido;
        private System.Windows.Forms.DataGridViewTextBoxColumn correo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cargo;
        private System.Windows.Forms.DataGridViewTextBoxColumn sueldo;
        private System.Windows.Forms.DataGridViewTextBoxColumn dirAge;
        private System.Windows.Forms.DataGridViewTextBoxColumn departamento;
        private System.Windows.Forms.DataGridViewTextBoxColumn Provincia;
        private System.Windows.Forms.DataGridViewTextBoxColumn distrito;
    }
}