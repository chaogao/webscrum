(function() {
	var ftypeCreate = function() {
	};

	ftypeCreate.prototype.getRulers = function(group) {
		var rulers = {"ftype[rulers]": []}, 
			ruler;
		group.find(".controls").each(function(index, domEl) {
			ruler = {};
			$(domEl).find(":input").each(function(index, inputEl) {
				if(inputEl.type == "checkbox") {
					if(inputEl.checked) {
						ruler[inputEl.name] = inputEl.value;
					}
				} else {
					ruler[inputEl.name] = inputEl.value;					
				}
			});
			rulers["ftype[rulers]"].push(ruler);
		});
		return $.param(rulers);
	};

	ftypeCreate.prototype.getParams = function() {
		var params = $("#f-ftype").serialize(),
			uRulers = $("#f-type-select .active").eq(0);
		params += ("&" + this.getRulers(uRulers));
		return params;
	};

	ftypeCreate.prototype.sendRequest = function(params) {
		$.ajax({
			url: "/ftypes",
			type: "post",
			dataType: "json",
			data: params
		}).success(function(res) {
			if (res.code === 0) {
				alert("添加成功");
				$("#f-ftype")[0].reset();
			} else {
				alert(res.msg);
			}
		}).error(function(res) {
			alert(res.msg);
		});
	};

	ftypeCreate.prototype.init = function() {
		var self = this;
		$("#f-ftype .submit").click(function() {
			var params = self.getParams();
			self.sendRequest(params);
			return false;
		});
	};

	new ftypeCreate().init();
})();