function addNewBank(){
    $.confirm({
        title: 'Add new bank',
        content: '<form action="/domain/banks/insert" method="post">' +
        '<div class="form-group">'+
        '<label>Identification number:</label>'+
        ' <input type="number" class="form-control" name="identification_number" placeholder="Identification number">'+
        ' </div>'+
        '<div class="form-group">'+
        '<label>Bank name</label>' +
        '<input type="text" class="form-control" name="bank_name" placeholder="Bank name">' +
        '</div>' +
        '<div class="form-group">' +
        ' <label>Max months for loan</label>' +
        '<input type="number" class="form-control" name="max_months" placeholder="Max months">' +
        '</div>'+
        '</div>'+
        '<div class="form-group">' +
        ' <label>Max credit for loan</label>' +
        '<input type="number" class="form-control" name="max_credit" placeholder="Max credit">' +
        '</div>'+
        '<div class="form-group">' +
        ' <label>Adminitrative costs</label>' +
        '<input type="number" class="form-control" name="administrative_costs" placeholder="Adminitrative costs">' +
        '</div>'+
        '<div class="form-group">' +
        ' <label>Euribor</label>' +
        '<input type="number" readonly class="form-control" name="id_euribor" placeholder="Euribor id" id="id_euribor" value="2">' +
        '</div>'+
        '<button style="float: right" type="submit" class="btn btn-success" style="float:right">Add bank</button>' +
        '<label>ATTENTION: Euribor is set automatically to 2 since its the second quarter of 2018 </label>'+
        '</form>',

        cancel: function(){

        }
    });
}

function addNewInterest() {
    $.confirm({
        title: 'Add new interest',
        content: '<form action="/domain/interests/insert" method="post">' +
        '<div class="form-group">'+
        '<label>Name of the bank</label>'+
        ' <input type="text" class="form-control" name="name" placeholder="Name of the bank">'+
        ' </div>'+
        '<div class="form-group">'+
        '<label>Value of the interest</label>' +
        '<input type="text" class="form-control" name="value" placeholder="Value of the interest">' +
        '</div>' +
        '<div class="form-group">' +
        ' <label>Type of interest</label>' +
        '<input type="number" class="form-control" name="id_typeinterest" placeholder="Type of interest id" id="id_typeinterest">' +
        '</div>'+
        '<button style="float: right" type="submit" class="btn btn-success" style="float:right">Add interest</button>' +
        '<label>ATTENTION: Type of interest can only be from range 1-3! </label>'+
        '</form>',

        cancel: function(){

        }
    });
}