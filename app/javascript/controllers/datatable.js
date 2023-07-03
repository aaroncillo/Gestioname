$(document).ready(function() {
  var table = $('#example').DataTable({

    buttons: [
      'copy', 'excel', 'pdf'
      ]

    "order": [[0, "asc"]], // Ordenar por la primera columna de forma ascendente
    "columnDefs": [
      {
        "targets": 'filterable', // Aplicar filtrado a columnas con la clase "filterable"
        "searchable": true,
        "orderable": true
      }
    ],
    "pagingType": "full_numbers",
    "pageLength": 5, // Mostrar solo 5 filas por página
    "lengthMenu": [5, 10, 25, 50] // Opciones de cantidad de filas a mostrar en el menú desplegable "Show entries"
  });

  table.buttons().container()
    .appendTo( $('.col-sm-6:eq(0)', table.table().container() ) ); // Mover los botones de exportación al contenedor deseado

  // Agregar evento al botón de búsqueda para actualizar la tabla después de borrar el término de búsqueda
  $("#searchBtn").on("click", function() {
    table.draw(); // Actualizar la tabla después de borrar el término de búsqueda
  });
});
