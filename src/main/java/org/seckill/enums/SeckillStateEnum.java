package org.seckill.enums;

/**
 * 使用枚举表述常量数据字典
 * 
 * @author 李奕锋
 */
public enum SeckillStateEnum {
	SUCCESS(1, "秒杀成功"), END(0, "秒杀结束"), REPEAT_KILL(-1, "重发秒杀"), INNER_ERROR(-2, "系统异常"), DATA_REWRITE(-3, "数据篡改");

	private int state;

	private String stateInfo;

	private SeckillStateEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static SeckillStateEnum stateOf(int index) {
		for (SeckillStateEnum state : values()) {
			if (state.getState() == index) {
				return state;
			}
		}
		return null;
	}

}
