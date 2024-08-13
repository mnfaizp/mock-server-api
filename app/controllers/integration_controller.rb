# frozen_string_literal: true

class IntegrationController < ApplicationController
  def oauth_url_generate
    redeem_code = request_body[:redeem_code]
    sequence = request_body[:sequence]

    if redeem_code.blank? || sequence.blank?
      render json: { message: "redeem_code or sequence is required", success: false }, status: :bad_request
    end

    redeem_code = RedeemCode.find_by(code: redeem_code)

    if redeem_code.nil?
      render json: { message: "redeem_code not found", success: false }, status: :not_found
      return
    end

    if redeem_code.status
      render json: { message: "redeem_code already used", success: false }, status: :bad_request
      return
    end

    if redeem_code.start_redeem_at > Time.current
      render json: { message: "redeem_code not yet available", success: false }, status: :bad_request
      return
    end

    if redeem_code.end_redeem_at < Time.current
      render json: { message: "redeem_code expired", success: false }, status: :bad_request
      return
    end

    session = Session.find_by(redeem_code: redeem_code, sequence: sequence)

    if session.blank?
      render json: { message: "sequence not found", success: false }, status: :not_found
      return
    end

    if session.attendance_status
      render json: { message: "sequence already attended", success: false }, status: :bad_request
      return
    end

    state = session.state

    render json: {
      message: "OK",
      success: true,
      data: {
        url: "https://example.com/oauth?session_id=#{state}",
        state: state
      }
    }
  end
end
