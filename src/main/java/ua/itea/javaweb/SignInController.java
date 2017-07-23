package ua.itea.javaweb;

public class SignInController {

	private User user;
	private String submitResult;
	private static int count = 0;
	private static boolean block = false;
	private static long blockTime;

	private final int NUMBER_OF_TRY = 3;
	private final long TIME_DELAY = (long)(1*60*1000);  //time (ms);
	private final String BLOCK_MESSAGE = "Blocked.";
	private final String FAIL_MESSAGE = "Authorization failed.";
	private final String SUCCESS_MESSAGE = "Authorized successfully.";


	public SignInController(){
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getSubmitResult() {
		if(block) {
			if ((blockTime + TIME_DELAY) <= System.currentTimeMillis()) {
				block = false;
				count = 0;
				if(user != null){
					submitResult = SUCCESS_MESSAGE;
				}else {
					submitResult = FAIL_MESSAGE;
					count++;
				}
			} else {
				long blockMinuteWait = (blockTime + TIME_DELAY - System.currentTimeMillis()) / (60 * 1000);
				long blockSecondsWait = ((blockTime + TIME_DELAY - System.currentTimeMillis())
						- (blockMinuteWait * 60 * 1000)) / 1000;

				submitResult = BLOCK_MESSAGE + "Wait "
						+ blockMinuteWait + " minutes " + blockSecondsWait + " seconds.";
			}
		}else{
			if(user != null){
				count = 0;
				submitResult = SUCCESS_MESSAGE;
			}else {
				submitResult = FAIL_MESSAGE;
				count++;
				if(count > NUMBER_OF_TRY) {
					blockTime = System.currentTimeMillis();
					block = true;
					submitResult = BLOCK_MESSAGE + " Wait "
							+ (TIME_DELAY/(60 * 1000)) + " minutes 0 seconds.";
				}
			}
		}
		return submitResult;
	}
}
