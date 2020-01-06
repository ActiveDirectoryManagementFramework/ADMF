# Group Policy Objects

## Synopsis

Define group policy objects to be applied.

Use Export-AdmfGpo to create an export of group policies to apply.
These should be copied in their entirety, including the generated exportData.json.
The system uses this exportData.json file to register the correct metadata, so getting that right kind of matters.
If you later want to update only a single gpo, export just that GPO into a new file, replace the GPO folder and _update_ the ExportID in exportData.json to the new value from the new export.

It is using that ExportID that the system will recognize the need to update a GPO!
