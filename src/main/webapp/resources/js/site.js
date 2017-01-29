$().ready(function() {
    $(".productForm").validate({
        rules: {
            barcode: {
                required: true,
                number: true
            },
            name: {
                required: true,
                rangelength: [2, 30]
            },
            releaseDate: {
                required: true
            },
            description: {
                required: true,
                rangelength: [5, 100]
            },
            price: {
                required: true,
                number: true
            },
            id: {
                required: true,
                number: true
            },
            secondName: {
                required: true,
                rangelength: [2, 30]
            },
            phonenumber: {
                required: true,
                rangelength: [5, 100]
            },
            country: {
                required: true
            },
            address: {
                required: true
            }
        },
        messages: {
            barcode: {
              required: "Barcode in required",
                number: "Barcode in number formate"
            },
            name: {
                required: "Field cannot be empty!",
                rangelength: "2-30 symbols, please"
            },
            description: {
                required: "Description information is required. Field cannot be empty!",
                rangelength: "5-100 symbols, please"
            },
            id: {
                required: "Id in required",
                number: "Id in number formate"
            },
            secondName: {
                required: "Second name cannot be empty",
                rangelength: "2-30 symbols, please"
            },
            country: {
                required: "Please add country"
            },
            address: {
                required: "Please add your address"
            },
            phonenumber: {
                required: "Please add your phone number"
            }
        }
    });
});
