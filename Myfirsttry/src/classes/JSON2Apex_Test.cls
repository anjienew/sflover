//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

@IsTest
public class JSON2Apex_Test {
	
	static testMethod void testParse() {
		String json = '{\"animals\":[\"majestic badger\",\"fluffy bunny\",\"scary bear\",\"chicken\"]}';
		JSON2Apex obj = JSON2Apex.parse(json);
		System.assert(obj != null);
	}
}