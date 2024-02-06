/* This is to check if the subproject works */
#include <unistd.h>
#include "raylib.h"

int main() {
	InitWindow(320, 240, "Test");
	BeginDrawing();
	EndDrawing();
	sleep(5);
	return(0);
}
