   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   B    <PokemonMicroBattler.PokemonMicroBattler.Windows.BattleWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	   U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com  5   	     � WindowStartupLocation$  CenterScreen=�5	   	    � WindowState$ Normal=�5
   	    � 
ResizeMode$ CanResizeWithGrip=�5   	    � SizeToContent$ Manual=�5   	    � Title$ Battle��5   	   $	��500��6   $	��800��6%    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5       5!      5"      .��5$      � -   5         �Name$ MainGrid��5$      ��5%   
   �� 5&       �� ImageSource$E ?/PokemonMicroBattler.Templates/Backgrounds/battlebackground.jpg��6    j� Stretch$
 Fill=�6g    � RowDefinitions 5)   
   �� 5*      $
��149* �6   �� 5+      $	��73* �6   �� 5,      $	��20* �6    � ColumnDefinitions 5/   
   �� 50      $
��399* �6   �� 51      $	��56* �6   �� 52      $
��311* �6   �� 53      $	��35* �6   .+�56   
   � $	��170��6   $	��Top=�6   .+�57      �� 
�������
���iii�$��5��6=   �� 58      -   5         ��Name$ 
BattleText��58      
���   �$
��Wrap=�6?   $��Showcard Gothic)�6S   $��20(�6p   $��10q�6~   $��Center=�6�   $��Center=�6�   �� 59      -   5         ��Name$ 
BackButton��59      $y�Hidden=�6)   $��50��6=   $	��120��6I   $��Bottom=�6U   $��Right=�6p   #��[  6�   ��6�   Z� ��5:      �� 5;      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6!   $ Uniform=�6^   5=      5>      � 5@   
   $��Right=�6   $��Bottom=�6+   .+�5A      �� 
���/���
���iii�$��3��6<   �� 5B      $4��./PokemonMicroBattler.Templates/Other/heart.png��6   $��20��6L   $
��Left=�6X   $��5,0,0,0q�6s   �� 5C      $4��./PokemonMicroBattler.Templates/Other/heart.png��6   $��20��6L   $��Right=�6X   $��0,0,5,0q�6t   �� 5D      -   5        $ Player1Health��5D      $��1q�6/    �� TextAlignment$ Center=�6:   $��30��6Q   $	��130��6]   $��Showcard Gothic)�6j   $��20(�6�   5E      � 5G   
   $
��Left=�6   $��Bottom=�6*   $��2��6E   .+�5H      �� 
���/���
���iii�$��3��6<   �� 5I      $4��./PokemonMicroBattler.Templates/Other/heart.png��6   $��20��6L   $
��Left=�6X   $��5,0,0,0q�6s   �� 5J      $4��./PokemonMicroBattler.Templates/Other/heart.png��6   $��20��6L   $��Right=�6X   $��0,0,5,0q�6t   �� 5K      -   5        $ Player2Health��5K      $��1q�6/   $ Center=�6:   $��30��6Q   $	��130��6]   $��Showcard Gothic)�6i   $��20(�6�   5L      �� 5N   
   -   5         ��Name$ Poke1��5N      $��Right=�6   $	��Top=�6;   $	��140��6S   $	��140��6`   $��0��6l   $��1��6|   �� 5O   
   -   5        $ Poke2��5O      $
��Left=�6   $��Bottom=�6:   $	��140��6U   $	��140��6b   $��2��6n   $��0��6~   $��0,0,0,50q�6�   �� 5Q   
   -   5        $ 
Player1Hit��5Q      $y�Hidden=�6$   "  WpfAnimatedGif.ImageBehavior   AnimatedSource$2 ,/PokemonMicroBattler.Templates/Other/hit.gif��68   $��Right=�6�   $	��Top=�6�   $	��200��6�   $	��200��6�   $��0��6�   $��1��6�   $��	0,0,100,0q�6�   �� 5R   
   -	   5        $ 
Player2Hit��5R      $y�Hidden=�6$   $2 ,/PokemonMicroBattler.Templates/Other/hit.gif��68   $
��Left=�6�   $��Bottom=�6�   $	��200��6�   $	��200��6�   $��2��6�   $��0��6�   �� 5U   
   -
   5        $ Attack1��5U      $��Showcard Gothic)�6"   $��1��6?   $��2��6L   $��50��6\   $	��120��6h   $	��Top=�6t   $
��Left=�6�   #��[  6�   ��6�   Z� ��5V      �� 5W      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   $ Uniform=�6a   5Y      �� 5Z   
   -   5        $ Attack2��5Z      $��Showcard Gothic)�6"   $��1��6?   $��2��6L   $��50��6\   $	��120��6h   $	��Top=�6t   $��Right=�6�   #��[  6�   ��6�   Z� ��5[      �� 5\      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   $ Uniform=�6a   5^      �� 5_   
   -   5        $ Attack3��5_      $��Showcard Gothic)�6"   $��1��6?   $��2��6L   $��50��6\   $	��120��6h   $��Bottom=�6t   $
��Left=�6�   #��[  6�   ��6�   Z� ��5`      �� 5a      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   $ Uniform=�6a   5c      �� 5d   
   -   5        $ Attack4��5d      $��Showcard Gothic)�6"   $��1��6?   $��2��6L   $��50��6\   $	��120��6h   $��Bottom=�6t   $��Right=�6�   #��[  6�   ��6�   Z� ��5e      �� 5f      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   $ Uniform=�6a   5h      5i      5j      