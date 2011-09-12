package pl.twerno.commLib.helpers {
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;

	public class ValidateHelper {
		
		public static function validateAll(validators:Array):Boolean {
			var result:Boolean = true;
			for each (var validator:Validator in validators)
				result = result && validator.validate().type == ValidationResultEvent.VALID;
			
			return result;	
		}
	}
}