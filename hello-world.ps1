. ./add-types.ps1

$pdfWriter   = [iText.Kernel.Pdf.PdfWriter    ]::new("$psScriptRoot/Hello-World.pdf")
$pdfDocument = [iText.Kernel.Pdf.PdfDocument  ]::new($pdfWriter                     )
$document    = [itext.Layout.Document         ]::new($pdfDocument                   )
$paragraph   = [iText.Layout.Element.Paragraph]::new('Hello World!'                 )

$null = $document.Add($paragraph)

$pdfDocument.Close()
