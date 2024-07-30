class EstimateMailer < ActionMailer::Base
  default from: "info@exterior-garden.jp"
  def received_email(estimate)
    @estimate = estimate
    mail to: "info@exterior-garden.jp"
    mail(subject: 'エクステリアガーデンにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def send_email(estimate)
    @estimate = estimate
    mail to: estimate.email
    mail(subject: 'エクステリアガーデンにお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def client_email(estimate)
    @estimate = estimate
    mail bcc: Company.all.map{|company| company.mail}
    mail(subject: '自販機お見積もり依頼') do |format|
      format.text
    end
  end

end
