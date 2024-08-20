package store.utils;

import java.io.IOException;

public class KillBrowser {

    private KillBrowser() {
        throw new IllegalStateException("Utility class");
    }

    public static void processes(String browser) throws IOException, InterruptedException {
        ProcessBuilder processBuilder = new ProcessBuilder("taskkill", "/F", "/IM", browser + ".exe");
        Process process = processBuilder.start();
        process.waitFor();
    }
}
