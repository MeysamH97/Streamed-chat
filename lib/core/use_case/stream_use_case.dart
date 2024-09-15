abstract class StreamUseCase <T, P>{

  Stream<T> call (P param);

}
class NoParams{}

/// این کلاس برای این ساخته شدده که  کل کلاس های یوز کیس های ما که callable کلاس هستند از این کلاس والد ارث بری کنند و دیگه برای هرر کدوم به صوررت مجزا متد call ننویسیم
///
///
/// callable کللاس ها کلاس هایی هستند که در اونها متد call وجود دارد
/// متد کال وقتی در یک کلاس استفاده میشود تنها با صدا زدن اسم اون کللاس متد کال خود به خود اجرا میشود