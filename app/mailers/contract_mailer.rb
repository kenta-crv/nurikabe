class ContractMailer < ActionMailer::Base
  default from: "info@tele-match.net"
  def received_email(contract)
    @contract = contract
    mail from: contract.email
    mail to: "info@tele-match.net"
    mail(subject: '『ぬりかべ』にお問い合わせがありました') do |format|
      format.text
    end
  end

  def send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: '『ぬりかべ』にお問い合わせ頂きありがとうございます。') do |format|
      format.text
    end
  end

  def contract_received_email(contract)
    @contract = contract
    mail to: "info@tele-match.net"
    mail(subject: '『ぬりかべ』で契約同意がありました') do |format|
      format.text
    end
  end

  def contract_send_email(contract)
    @contract = contract
    mail to: contract.email
    mail(subject: '『ぬりかべ』の加盟店契約をいただきありがとうございます。') do |format|
      format.text
    end
  end

  def received_first_email(contract)
    @contract = contract
    @contract_url = "https://ri-plus.jp/contracts/#{contract.id}"
    mail(to: "okuyama@ri-plus.jp", subject: "【#{@contract.company}】契約発行通知")
  end

  def send_first_email(contract)
    @contract = contract
    @contract_url = "https://ri-plus.jp/contracts/#{contract.id}"
    mail(from:"info@tele-match.net", to: @contract.email, subject: "契約締結のご案内")
  end

  def new_comment_notification(comment)
    @comment = comment
    @contract = comment.contract
    @contract_url = "https://ri-plus.jp/contracts/#{@contract.id}"
    mail to: "reply@ri-plus.jp"
    mail(subject: "#{@contract.company}のステータスが#{@comment.status}に更新されました") do |format|
      format.text
    end
  end

end
