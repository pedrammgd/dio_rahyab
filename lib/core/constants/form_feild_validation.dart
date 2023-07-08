String? Function(String?) emptyValidator(String fieldName) =>
        (String? value) => value?.trim().isNotEmpty != true
        ? ' Please enter $fieldName'
        : null;