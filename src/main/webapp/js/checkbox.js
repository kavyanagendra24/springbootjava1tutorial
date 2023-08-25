 function handleCheckboxClick(checkbox) {
            // Disable all other checkboxes
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (cb) {
                if (cb !== checkbox) {
                    cb.disabled = checkbox.checked;
                }
            });
        }