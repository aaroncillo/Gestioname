class PaymentsController < ApplicationController
    before_action :set_payment, only: %i[ show edit update destroy ]

    # GET /payments
    def index
      @payments = Payment.all
    end

    # GET /payments/1
    def show
    end

    # GET /payments/new
    def new
      @payment = Payment.new
    end

    # GET /payments/1/edit
    def edit
    end

    # POST /payments
    def create
      @payment = Payment.new(payment_params)
      

      if @payment.save
        redirect_to @payment, notice: "Payment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /payments/1
    def update
      if @payment.update(payment_params)
        redirect_to @payment, notice: "Payment was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /payments/1
    def destroy
      @payment.destroy
      redirect_to payments_url, notice: "Payment was successfully destroyed.", status: :see_other
    end

    private
      # usa callbacks para compartir un setup común o cierto tipo de accionse.
      def set_payment
        @payment = Payment.find(params[:id])
      end

      # solo deja pasar ciertos atributos
      def payment_params
        params.require(:payment).permit(:subscription_id, :payment_date, :amount, :status)
      end
end
