using namespace iText.Kernel.Pdf
using namespace iText.Layout
using namespace iText.Layout.Element

. ./add-types.ps1

$pdfWriter   = [PdfWriter  ]::new("$psScriptRoot/Hello-World-using-namepsace.pdf")
$pdfDocument = [PdfDocument]::new($pdfWriter                                     )
$document    = [Document   ]::new($pdfDocument                                   )
$paragraph   = [Paragraph  ]::new('Hello World!'                                 )

$null = $document.Add($paragraph)

$pdfDocument.Close()
