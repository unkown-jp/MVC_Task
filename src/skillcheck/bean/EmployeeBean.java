package skillcheck.bean;

// FIXME Step-1-1: コンストラクタの修正および、フィールド_nameに対してgetter, setterを用意してください。
/**
 * 社員情報データ（モデル）
 */
public final class EmployeeBean {
	
    /** ・社員番号 */
    private String _empId;
    /** ・パスワード */
    private String _password;
    /** ・名前 */
    private String _name;
    /** ・メールアドレス */
    private String _mail;
    /** ・得意言語 or 学習中の言語 */
    private String _programingLanguage;
    /** ・コメント（一言） */
    private String _comment;
    /** ・削除フラグ（0:未削除/1:削除） */
    private String _deleteFlg;

    /**
     * コンストラクタ: パラメーターなし
     */
    public EmployeeBean() {
    }

    /**
     * コンストラクタ
     *
     * @param empId
     */
    public EmployeeBean(String empId) {
        this._empId = empId;
    }

    /**
     * コンストラクタ: パラメーターあり（削除フラグ以外）
     *
     * @param empId <pre>社員番号</pre>
     * @param password <pre>パスワード</pre>
     * @param name <pre>名前</pre>
     * @param mail <pre>メールアドレス</pre>
     * @param programingLanguage <pre>プログラミング言語</pre>
     * @param comment <pre>コメント</pre>
     */
    public EmployeeBean(String empId, String password, String name, String mail, String programingLanguage, String comment) {
        this._empId = empId;
        this._password = password;
        this._name = name;
        this._mail = mail;
        this._programingLanguage = programingLanguage;
        this._comment = comment;
    }

    /**
     * コンストラクタ: パラメーターあり（全て）
     *
     * @param empId <pre>社員番号</pre>
     * @param password <pre>パスワード</pre>
     * @param name <pre>名前</pre>
     * @param mail <pre>メールアドレス</pre>
     * @param programingLanguage <pre>プログラミング言語</pre>
     * @param comment <pre>コメント</pre>
     * @param deleteFlg <pre>削除フラグ</pre>
     */
    public EmployeeBean(String empId, String password, String name, String mail, String programingLanguage, String comment, String deleteFlg) {
        this._empId = empId;
        this._password = password;
        this._name = name;
        this._mail = mail;
        this._programingLanguage = programingLanguage;
        this._comment = comment;
        this._deleteFlg = deleteFlg;
    }


	/**
     * @param empId <pre>セットするStringクラスの社員番号</pre>
     */
    public void setEmpId(String empId) {
        this._empId = empId;
    }

    /** @return String型の社員番号 */
    public String getEmpId() {
        return _empId;
    }

	/** @return String型のパスワード */
    public String getPassword() {
        return _password;
    }

    /**
     * @param mail <pre>セットするStringクラスのメールアドレス</pre>
     */
    public void setMail(String mail) {
        this._mail = mail;
    }

    /** @return String型のメールアドレス */
    public String getMail() {
        return _mail;
    }

    /**
     * @param programingLanguage <pre>セットするStringクラスのプログラミング言語</pre>
     */
    public void setProgramingLanguage(String programingLanguage) {
        this._programingLanguage = programingLanguage;
    }

    /** @return String型のプログラミング言語 */
    public String getProgramingLanguage() {
        return _programingLanguage;
    }

    /**
     * @param comment <pre>セットするStringクラスのコメント</pre>
     */
    public void setComment(String comment) {
        this._comment = comment;
    }

    /** @return String型のコメント */
    public String getComment() {
        return _comment;
    }

    /**
     * @param deleteFlg <pre>セットするStringクラスの削除フラグ</pre>
     */
    public void setDeleteFlg(String deleteFlg) {
        this._deleteFlg = deleteFlg;
    }

    /** @return String型の削除フラグ */
    public String getDeleteFlg() {
        return _deleteFlg;
    }

}
