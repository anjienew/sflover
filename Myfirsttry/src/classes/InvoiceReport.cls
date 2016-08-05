public class InvoiceReport {
    public static void printInvoiceReport(){
        Reports.ReportResults results = Reports.ReportManager.runReport('00OF00000079FUU');
		//System.debug('Synchronous results: ' + results);
		
        Reports.ReportMetadata rm = results.getReportMetadata();
        System.debug('ID: ' + rm.getId());
        System.debug('Detail columns: ' + rm.getDetailColumns());
		        
    }

}