   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   J    DPokemonMicroBattler.PokemonMicroBattler.Windows.BattleSelectorWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	   U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com  5   	     � WindowStartupLocation$  CenterScreen=�5	   	    � WindowState$ Normal=�5
   	    � 
ResizeMode$ CanResizeWithGrip=�5   	    � SizeToContent$ Manual=�5   	    � Title$ Battle Selector��5   	   $	��500��6!   $	��800��6.    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5       5!      5"      .��5$      � -   5         �Name$ MainGrid��5$      ��5%   
   �� 5&       �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg��6    j� Stretch$
 Fill=�6a    � RowDefinitions 5(   
   �� 5)      $��4* �6   6*   �� 5*      $��9* �6   6*    � ColumnDefinitions 5,   
   �� 5-      �� 5.      �� 5/      �� 50      .+�53   
   �� -   5         ��Name$ TypeBox��53   _   $��2q�6   
���   �$��Center=�6;   $��40��6p   $	��150��6|   $��Center=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��3��6�   $��Bottom=�6   54       �� Color��%S   (��       55   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   56      57      �� 59   
   -   5         ��Name$ 
BackButton��59      $��0��6%   $��30��65   $��30��6A   $
��Left=�6L   $	��Top=�6g   #��[  6�   ��6   Z� ��6�   Z� ��5:      �� 5;      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6   5=      �� 5?   
   $��Player:��6   $��	0,0,0,100q�6"   $��0��65   $��Right=�6E   $��40��6a   $��Center=�6m   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5@   
   $��Pokemon:��6   $��0��6#   $��Right=�63   $��40��6O   $��Center=�6[   $	��170��6v   $��Showcard Gothic)�6�   $��25(�6�   �� 5A   
   -   5        $ StartButton��5A      $��Start��6&   $��0��66   $��50��6F   $��Center=�6R   $��Bottom=�6o   $	��150��6�   #��[  6�   
���   �$��Showcard Gothic)�6�   $��25(�6  ��6�   Z� ��5B      �� 5C      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   5E      �� 5G   
   -   5         ��Name$ Player1Name��5G      $��1��6'   $��Center=�67   $��40��6T    �� TextWrapping$
 Wrap=�6`   $	��Top=�6t   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5H   
   -   5         ��Name$ SelectedPokemonPlayer1��5H      
�������
���iii�$��3q�6`   $��1��6t   $��Center=�6�   $��Center=�6�   $��50��6�   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5I   
   -   5        $ SelectButton1��5I      $��1��6(   $��40��68   $��Center=�6D   $��Bottom=�6a   $��40��6|   #��[  6�   ��6�   Z� ��6�   Z� ��5J      �� 5K      $9 3/PokemonMicroBattler.Templates/Other/battleball.png��6   5M      �� 5O   
   -   5        $ Player2Name��5O      $��2��6'   $��Center=�67   $��40��6T   $
 Wrap=�6`   $	��Top=�6t   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5P   
   -	   5        $ SelectedPokemonPlayer2��5P      
�������
���iii�$��3q�6`   $��2��6t   $��Center=�6�   $��Center=�6�   $��50��6�   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5Q   
   -
   5        $ SelectButton2��5Q      $��2��6(   $��40��68   $��Center=�6D   $��Bottom=�6a   $��40��6|   #��[  6�   ��6�   Z� ��6�   Z� ��5R      �� 5S      $9 3/PokemonMicroBattler.Templates/Other/battleball.png��6   5U      �� 5W   
   $��Search:��6   $��	0,0,0,100q�6"   $��3��66   $��Center=�6F   $��40��6c   $��Center=�6o   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5X   
   -   5        $ 	SearchBar��5X      $��3��6%   $��Center=�65   $��40��6R   $
 Wrap=�6^   $��Center=�6r   $	��170��6�   $��Showcard Gothic)�6�   $��25(�6�   6�   �� 5Z   
   $��Hidden=�6   $��1��6<   $��4��6I   .��5[      �� -   5         ��Name$ ItemControl��5[      ��5\      �� 5]      .R�5^      �  � Orientation$ 
Horizontal=�6$   $��Center=�6=   5_      ��5a      �� 5b      .R�5c      ��  ��Name$ ChangingBorder��6!   -   5        
���   � �� CornerRadius$ 10��5c   M   $��2q�6_   $��15q�6s   $	��230��6   $	��200��6�   ���	#FFEDEBD6 J� Effect 5d      3  -System.Windows.Media.Effects.DropShadowEffect  5e   "      
BlurRadius$ 20Q�63      Color$ Black��6C      Opacity$	 1.5Q�6Q   6a   ._�5g      � .+�5h   "   ��   �� Padding$  10q�6,   $��Center=�69   $��Showcard Gothic)�6l   $��Normal"�6�   $��22(�6�   ��6V   �� *Name+6�   �� 5i   "   $	��100��6?   $	��100��6K   ��6(   �� *Img+6K   �� 5j   "   $ PokedexButton��6@   -   5        $��50��5j   W   $��Center=�6c   $��0,0,0,10q�6�   $��Bottom=�6�   $��50��6�   #��[  6�   ��6)   �� *ID+��6�   Z� ��6�   Z�  5k   &     5l   *   ��5n   &   �� 5o   *   $6 0/PokemonMicroBattler.Templates/Other/dexball.png��65   5q   #   5r      5s      5t      5v      5w      5x      5y      