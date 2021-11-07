using namespace iText.Layout
using namespace iText.Layout.Element
using namespace iText.Kernel.Pdf
using namespace iText.Kernel.Pdf.Canvas.Parser
using namespace iText.Kernel.Pdf.Canvas.Parser.Listener

param (
   [string] $pdfName
)

if (-not (test-path $pdfName)) {
   write-host "$pdfName does not exist"
   return
}

. ./add-types.ps1

#
#  A PdfReader reads and parses a PDF document.
#
$pdfReader = [PdfReader]::new($pdfName);

$pdfDocument = [iText.Kernel.Pdf.PdfDocument]::new($pdfReader)
$totalPages = $pdfDocument.GetNumberOfPages()
write-host "Number of pages: $totalPages"


[ITextExtractionStrategy] $strategy = [SimpleTextExtractionStrategy]::new()
for ($p = 1; $p -le $totalPages; $p++) {
   write-host "  page: $p"
   $page = $pdfDocument.GetPage($p)
   $text = [PdfTextExtractor]::GetTextFromPage($page, $strategy);

   write-host $text
}

$pdfReader.Close();
