import jsasync.IJSAsync;

using jsasync.JSAsyncTools;
using tink.core.Promise;
using tink.core.Outcome;

class MyClass implements IJSAsync {
	@:jsasync  static function ccc() {
		return "hi";
	}

	@:jsasync public static function example() {
		var result = ccc().jsawait();
		return result;
	}
}

class Main {
	static function main() {
		trace("Hello, world!");
        var x = MyClass.example().ofJsPromise();
        x.map((s) -> trace(s.sure()));
	}
}
