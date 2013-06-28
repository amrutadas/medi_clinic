window.onload = function() {
    var txts = document.getElementsByTagName('TEXTAREA')
    for(var i = 0, l = txts.length; i < l; i++) {
        if(/^[0-9]+$/.test(txts[i].getAttribute("maxlength"))) {
            $(txts[i]).after($("<div>").addClass("charsRemaining clearall alert_error").hide());
            var func = function() {
                var len = parseInt(this.getAttribute("maxlength"), 10);
                if(this.value.length > len) {
                    var errMsg = 'Max. length exceeded: ' + len + " chars.<br/>Please shorten your text.";
                    $("#"+this.id).next(".charsRemaining").html(errMsg).show();
                    this.value = this.value.substr(0, len+1);
                    return false;
                } else {
                    $("#"+this.id).next(".charsRemaining").hide();
                }
            }
            txts[i].onkeyup = func;
            txts[i].onblur = func;
        }
    }
} 

function expand_collapse(section, header) {
    $("#"+header).removeClass("ui-icon-triangle-1-s");
    $("#"+header).removeClass("ui-icon-triangle-1-e");
    if($("#"+section).is(":visible") == true){
        $("#"+section).hide();
        $("#"+header).addClass("ui-icon-triangle-1-e");
    } else {
        $("#"+section).show();
        $("#"+header).addClass("ui-icon-triangle-1-s");
    }

}
function skip_file_validation_for(file_field){
    skip_validation = false;
    var file_field_name = "#"+(file_field.substring(0,file_field.lastIndexOf("["))+"[_destroy]").replace(/\[/g,"_").replace(/\]/g,"");
    skip_validation = $(file_field_name).val();

    return skip_validation;
};

function remove_fields(link) {
    //set delete to be true to not to upload the file
    $(link).prev("input[type=hidden]").val("1");
    // reset the file name to be blank..
    // since the file field is previous to the hidden destroy hidden field below is workaround
    var hidden_field = $(link).prev("input[type=hidden]");
    var file_field = $(hidden_field).prev("input[type=file]");
    if ($.browser.msie) {
        $(file_field).replaceWith($(file_field).clone());
    }
    else {
        $(file_field).val('');
    }
    //Hide the field
    $(link).closest(".fields").hide();
};

var myValue;
myValue = 1;
function add_fields(link, association, content) {
    //   var new_id = new Date().getTime();
    var new_id = myValue;
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
    myValue = myValue + 1;
};

function show_hide(element, value) {
    if(element == 'client_approval_attachment'){
        if (value == "No") {
            $("#"+element).val('');
            $("#"+element).show();
        } else {
            $("#"+element).val('');
            $("#"+element).hide();
        }
    }
    else{
        if (value == "Yes") {
            $("#"+element).val('');
            $("#"+element).show();
        } else {
            $("#"+element).val('');
            $("#"+element).hide();
        }
    }
    if(element == 'additional_software_list' && value != "Yes")
    {
        var all_checkbox = $("input:checkbox");
        var addl_sw_checkbox = $.grep(all_checkbox, function(e) {
            return e.id == "additional_softwares_";
        });
        for (var i=0; i < addl_sw_checkbox.length; i++)
        {
            addl_sw_checkbox[i].checked = 0;
        }
    }
}

function isInt(n) {
    if(n.indexOf(".") != -1) {
        return false;
    } else {
        return n % 1 == 0;
    }
}
function show_hide_client_name(value) {
    $("#"+form_name+"approver_client_name").val('');
    if (value == "Yes") {
        $("#client_name").show();
    } else {
        $("#client_name").hide();
    }
};

function show_hide_file_field(file_type, div_name, value){
    var fields = document.getElementsByTagName('input');
    for(x=0; x < fields.length; x++){
        if (fields[x].getAttribute('type') == 'file'){            
            if (fields[x].id.search(file_type) !== -1)
            {             
                fields[x].value = '';
            }
        }
    }
    if (file_type == 'approval'){
        if (value == "No") {
            $("#"+div_name).show();
        } else {
            $("#"+div_name).hide();
        }
    }
    else{
        if (value == "Yes") {
            $("#"+div_name).show();
        } else {
            $("#"+div_name).hide();
        }
    }
};