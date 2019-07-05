package com.kh.ti.travelBoard.model.vo;

public class TravelCost implements java.io.Serializable {
	private int costId;
	private String costContent;
	private int costAmount;
	private int schId;
	private int dayId;
	private String costType;
	private String currency;
	
	private String roomCharge;
	private String trafficCharge;
	private String foodCharge;
	private String shoppingCharge;
	private String sightseeingCharge;
	private String etcCharge;
	private String totalCost;
	
	public TravelCost() {}

	public TravelCost(int costId, String costContent, int costAmount, int schId, int dayId, String costType,
			String currency, String roomCharge, String trafficCharge, String foodCharge, String shoppingCharge,
			String sightseeingCharge, String etcCharge, String totalCost) {
		super();
		this.costId = costId;
		this.costContent = costContent;
		this.costAmount = costAmount;
		this.schId = schId;
		this.dayId = dayId;
		this.costType = costType;
		this.currency = currency;
		this.roomCharge = roomCharge;
		this.trafficCharge = trafficCharge;
		this.foodCharge = foodCharge;
		this.shoppingCharge = shoppingCharge;
		this.sightseeingCharge = sightseeingCharge;
		this.etcCharge = etcCharge;
		this.totalCost = totalCost;
	}

	public int getCostId() {
		return costId;
	}

	public void setCostId(int costId) {
		this.costId = costId;
	}

	public String getCostContent() {
		return costContent;
	}

	public void setCostContent(String costContent) {
		this.costContent = costContent;
	}

	public int getCostAmount() {
		return costAmount;
	}

	public void setCostAmount(int costAmount) {
		this.costAmount = costAmount;
	}

	public int getSchId() {
		return schId;
	}

	public void setSchId(int schId) {
		this.schId = schId;
	}

	public int getDayId() {
		return dayId;
	}

	public void setDayId(int dayId) {
		this.dayId = dayId;
	}

	public String getCostType() {
		return costType;
	}

	public void setCostType(String costType) {
		this.costType = costType;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getRoomCharge() {
		return roomCharge;
	}

	public void setRoomCharge(String roomCharge) {
		this.roomCharge = roomCharge;
	}

	public String getTrafficCharge() {
		return trafficCharge;
	}

	public void setTrafficCharge(String trafficCharge) {
		this.trafficCharge = trafficCharge;
	}

	public String getFoodCharge() {
		return foodCharge;
	}

	public void setFoodCharge(String foodCharge) {
		this.foodCharge = foodCharge;
	}

	public String getShoppingCharge() {
		return shoppingCharge;
	}

	public void setShoppingCharge(String shoppingCharge) {
		this.shoppingCharge = shoppingCharge;
	}

	public String getSightseeingCharge() {
		return sightseeingCharge;
	}

	public void setSightseeingCharge(String sightseeingCharge) {
		this.sightseeingCharge = sightseeingCharge;
	}

	public String getEtcCharge() {
		return etcCharge;
	}

	public void setEtcCharge(String etcCharge) {
		this.etcCharge = etcCharge;
	}

	public String getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}

	@Override
	public String toString() {
		return "TravelCost [costId=" + costId + ", costContent=" + costContent + ", costAmount=" + costAmount
				+ ", schId=" + schId + ", dayId=" + dayId + ", costType=" + costType + ", currency=" + currency
				+ ", roomCharge=" + roomCharge + ", trafficCharge=" + trafficCharge + ", foodCharge=" + foodCharge
				+ ", shoppingCharge=" + shoppingCharge + ", sightseeingCharge=" + sightseeingCharge + ", etcCharge="
				+ etcCharge + ", totalCost=" + totalCost + "]";
	}
	
}
