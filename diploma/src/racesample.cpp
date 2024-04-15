std::atomic<int> counter = 0;

void thread1() {
	if (counter < 1)
		counter++;
}

void thread2() {
	if (counter < 1)
		counter++;
}