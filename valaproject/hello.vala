class Demo.HelloWorld : GLib.Object {

	public static int main(string[] args) {

		string text = "This is a string literal\n";

		stdout.printf(text + "Hello, World!\n");

		int[] list = {};
		list += 4;
		list += 2;

		for(int i = 0; i < list.length; i++) {
			print(list[i].to_string() + "\n");
		}

		if(3 > 1){
			stdout.printf("Három nagyobb mint 1.:)\n");
		}




		return 0;
	}
}
