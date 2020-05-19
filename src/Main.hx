import jsasync.IJSAsync;

using jsasync.JSAsyncTools;
using tink.core.Promise;
using tink.core.Outcome;

class MyClass implements IJSAsync {
	@:jsasync static function ccc() {
		return "hi";
	}

	inline static function wait(n)
		return new js.lib.Promise((resolve, reject) -> {
			haxe.Timer.delay(() -> resolve(null), n);
		});

	@:jsasync public static function example() {
		var result = ccc().jsawait() + ccc().jsawait() + ccc().jsawait();
		wait(3000).jsawait();
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
