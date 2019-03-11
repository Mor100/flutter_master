package com.example.mygraduation;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;

public class NewsDetailActivity extends AppCompatActivity {
    private WebView webView;
    private TextView tvTitle;
    private ImageView ivBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_news_detail);

        getActionBar().hide();

        webView = findViewById(R.id.wv);
        tvTitle = findViewById(R.id.tv_title);
        ivBack = findViewById(R.id.iv_back);

        Intent intent = getIntent();
        webView.loadUrl(intent.getStringExtra("url"));
        tvTitle.setText(intent.getStringExtra("title"));
        ivBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Log.d("图片单击事件：","=================================================");
            }
        });
    }
}
