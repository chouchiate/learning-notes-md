## [java] - Enum

```java
	public enum PairingStage
	{
		STAGE_CONNECT(R.string.stage_connect),
		STAGE_SEND_CLOUD_DETAILS(R.string.stage_send_cloud_details),
		STAGE_PAIRING(R.string.stage_pair),
		STAGE_CLOUD_PAIRING(R.string.stage_cloud_pairing),
		STAGE_NOTIFY_PAIRING(R.string.stage_notify_pairing_complete),
		STAGE_CHECK_OTA(R.string.stage_check_ota),
		STAGE_PERFORM_OTA(R.string.stage_perform_ota),
		STAGE_REBOOT(R.string.stage_reboot),
		STAGE_REBOOT_TO_FACTORY(R.string.stage_reboot_to_factory);

		int _stringRes;

		PairingStage(int stringResId)
		{
			_stringRes = stringResId;
		}

		public int getStringRes()
		{
			return _stringRes;
		}

	}

```
