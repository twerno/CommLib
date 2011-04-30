package pl.twerno.commLib.helpers {
	public class DateHelper {
		
		public static function timePassed(startTime:Date, endTime:Date = null):Date {
			if (!startTime) return null;
			if (!endTime) endTime = new Date();
			var result:Date = new Date();
			result.setTime(endTime.time -startTime.time);
			return result;
		}
	}
}