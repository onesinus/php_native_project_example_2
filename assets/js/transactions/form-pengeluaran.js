$(document).ready(function() {
    const clearForm = () => {
        $("#description_pengeluaran").val("");
        $("#amount_pengeluaran").val(0);
        $("#balance").val($("#total_balance").val());
        $("#remaining_balance").val(0);
    }

    const validatePengeluranDetail = () => {
        const caDetail = $("#pengeluaranDetail tr");
        let row = []
        caDetail.each(function() {
            let col = []
            const td = $(this).find("td");
            td.each(function() {
                let text = $(this).text().replace("Rp. ", "")
                col.push(text)
            });
            row.push(col);
        })

        if(row.length > 0) {
            return row;
        }

        swal({
            title: "Please fill all Transaction Detail Data input",
            text: `There is empty input field in Transaction Detail`,
            icon: "error",
            dangerMode: true,
        });

        return false;
    }

    const getPengeluaran= () => {
        return validatePengeluranDetail();
    }
    
    $("#amount_pengeluaran").change(function() {
        const balance = $("#balance").val();
        const amount = $("#amount_pengeluaran").val();
        const total_balance = $("#total_balance");

        const remaining_balance = balance - amount;

        $("#remaining_balance").val(remaining_balance);
        
        total_balance.val(remaining_balance);
    });

    $('#btnSaveRow').click(function() {
        const description_pengeluaran = $("#description_pengeluaran").val();

        const balance = $("#balance");
        const remaining_balance = $("#remaining_balance");
        const amount_pengeluaran = $('#amount_pengeluaran');
        const grand_total = $("#grand_total");

        if (description_pengeluaran == "" || amount_pengeluaran.val() <= 0) {
            swal({
                title: "Validation",
                text: `Please fill description and Amount`,
                icon: "error",
                dangerMode: true,
            });
        }
        else if ($("#total_balance").val() < 0) {
            swal({
                title: "Validation",
                text: `Amount cannot more than Balance`,
                icon: "error",
                dangerMode: true,
            });
        } else {
            const new_total = (parseFloat(grand_total.val()) || 0) + (parseFloat(amount_pengeluaran.val()) || 0);
            grand_total.val(new_total);
        
            const display_total = $("#display_total");
            display_total.text('Rp. ' + new_total);
            
            $("#pengeluaranDetail").append(`
                <tr>
                    <td style='width: 25%'>${description_pengeluaran}</td>
                    <td style='width: 25%' class='text-right'>${balance.val()}</td>
                    <td style='width: 25%' class='text-right'>${remaining_balance.val()}</td>
                    <td style='width: 25%' class='text-right'>${amount_pengeluaran.val()}</td>
                </tr>
            `);
    
            clearForm();
        }
    });

    $('#btnDeleteRow').click(function() {
        clearForm();
    });
    

    $('#btnSavePengeluaran').click(function() {
        if(getPengeluaran()) {
            swal({
                title: "Confirm Save",
                text: `Are you sure you want to save Transaction`,
                icon: "warning",
                buttons: true,
                dangerMode: true,
                })
                .then((willSave) => {
                if (willSave) {
                    const type = $("#type").val();
                    const grand_total = $("#grand_total").val();
                    const values = {data: [type, grand_total], detail: getPengeluaran()}
                    saveData(values)
                }
            });
        }
    });
})